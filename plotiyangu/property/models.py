from django.db import models
from django.dispatch import receiver
from django.db.models.signals import pre_save
import uuid
from django.core.exceptions import ValidationError,ObjectDoesNotExist
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.hashers import make_password

class CustomUser(AbstractUser):
    USER_TYPE_CHOICES = [
        ('tenant', 'Tenant'),
        ('landlord', 'Landlord'),
        ('admin', 'Admin'),
    ]
    user_type = models.CharField(max_length=10, choices=USER_TYPE_CHOICES)

    # Override the save method to hash the password
    def save(self, *args, **kwargs):
        # Check if the password has been changed
        if 'password' in self.__dict__ and self.password != self._password:
            # New password, set and hash it
            self.set_password(self.password)

        return super().save(*args, **kwargs)

    def __str__(self):
        return self.username
    
# Create your models here.
class Tenant(models.Model):
    tenant_id = models.CharField(primary_key=True, max_length=10, unique=True, editable=False)    
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    description = models.TextField(blank=True, null=True)
    username = models.CharField(max_length=30, unique=True)
    intake_date = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(null=True, blank=True)
    profile_pic = models.FileField(upload_to='profile_pics/', null=True, blank=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.username
    def save(self, *args, **kwargs):
        if not self.tenant_id:
            # Generate a unique ID using UUID4
            self.tenant_id = 'T' + str(uuid.uuid4().hex)[:4].upper()

        super(Tenant, self).save(*args, **kwargs)

# Automatically generate user_id before saving the object
@receiver(pre_save, sender=Tenant)
def pre_save_tenant(sender, instance, **kwargs):
    if not instance.tenant_id:
        # Generate a unique ID using UUID4
        instance.user_id = 'T' + str(uuid.uuid4().hex)[:9].upper()

    

class Caretaker(models.Model):
    caretaker_id = models.CharField(primary_key=True, max_length=10, unique=True, default='C1')
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    description = models.TextField(blank=True, null=True)
    username = models.CharField(max_length=30, unique=True)
    hire_date = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(null=True, blank=True)
    profile_pic = models.FileField(upload_to='caretaker_profile_pics/', null=True, blank=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.username
    
class Property(models.Model):
    property_id = models.CharField(primary_key=True, max_length=10, unique=True, default='P1')
    property_name = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    property_images = models.FileField(upload_to='property_images/', null=True, blank=True)
    description = models.TextField(blank=True, null=True)
    active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.property_name
    

class Unit(models.Model):
    unit_id = models.CharField(primary_key=True, max_length=10, unique=True, editable=False)
    description = models.TextField(blank=True, null=True)
    unit_type = models.CharField(max_length=20, choices=[
        ('bedsitter', 'Bedsitter'),
        ('two_bedroom', 'Two Bedroom'),
        ('single', 'Single'),
        ('one_bedroom', 'One Bedroom'),
    ])
    rent_amount = models.DecimalField(max_digits=10, decimal_places=2)
    active = models.BooleanField(default=True)
    property_name = models.ForeignKey('Property', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.unit_type} - {self.unit_id}"

    def save(self, *args, **kwargs):
        if not self.unit_id:
            # Generate a unique ID using UUID4
            self.unit_id = 'U' + str(uuid.uuid4().hex)[:3].upper()

        super().save(*args, **kwargs)   
    
class Contract(models.Model):
    contract_id = models.CharField(primary_key=True, max_length=10, unique=True, editable=False)
    tenant_name = models.ForeignKey(Tenant, on_delete=models.CASCADE)
    unit_id = models.ForeignKey(Unit, on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True, null=True)
    contract_image = models.FileField(upload_to='contract_images/', null=True, blank=True)

    def save(self, *args, **kwargs):
        if not self.contract_id:
            # Generate a unique ID using UUID4
            self.contract_id = 'C' + str(uuid.uuid4().hex)[:3].upper()

        # Check if the unit is already assigned to another contract
        existing_contract = Contract.objects.filter(unit_id=self.unit_id).exclude(pk=self.pk).first()
        if existing_contract:
            raise ValidationError("This unit is already assigned to another tenant's contract")

        if self.pk:
            try:
                # Fetch the original contract
                original_contract = Contract.objects.get(pk=self.pk)
                if original_contract.unit_id != self.unit_id:
                    # If the unit is changing, return the original unit to True
                    original_contract.unit_id.active = True
                    original_contract.unit_id.save()
            except Contract.DoesNotExist:
                # Handle the case where Contract with the specified primary key does not exist
                pass

        # Update the associated unit's active field to False
        if self.unit_id:
            self.unit_id.active = False
            self.unit_id.save()

        super().save(*args, **kwargs)
    
    def delete(self, *args, **kwargs):
        # Get the associated unit
        unit = self.unit_id

        # Set the associated unit's active field to True before deleting the contract
        if unit:
            unit.active = True
            unit.save()

        super().delete(*args, **kwargs)

    def __str__(self):
        return f"Contract {self.contract_id} - {self.tenant_name} - {self.unit_id}"

class Payment(models.Model):
    payment_id = models.CharField(primary_key=True, max_length=10, unique=True, editable=False)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField()
    contract_id = models.ForeignKey(Contract, on_delete=models.CASCADE)
    payment_method = models.CharField(max_length=20, choices=[
        ('mpesa', 'Mpesa'),
        ('bank', 'Bank'),
        ('cash', 'Cash'),
    ])
    created_at = models.DateTimeField(auto_now_add=True)
    payment_reference_no = models.CharField(max_length=20, blank=True, unique=True, null=True)

    def save(self, *args, **kwargs):
        if not self.payment_id:
            # Generate a unique ID using UUID4
            self.payment_id = 'P' + str(uuid.uuid4().hex)[:8].upper()

        super().save(*args, **kwargs)

    def __str__(self):
        return f"Payment {self.payment_id} - Contract {self.contract_id}"
