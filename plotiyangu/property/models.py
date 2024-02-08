from django.db import models

# Create your models here.
class Tenant(models.Model):
    user_id = models.CharField(primary_key=True, max_length=10, unique=True, default='T1')
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    description = models.TextField(blank=True, null=True)
    username = models.CharField(max_length=30, unique=True)
    password = models.CharField(max_length=128)  
    intake_date = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(null=True, blank=True)
    profile_pic = models.FileField(upload_to='profile_pics/', null=True, blank=True)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.username
    

class Caretaker(models.Model):
    user_id = models.CharField(primary_key=True, max_length=10, unique=True, default='C1')
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15)
    description = models.TextField(blank=True, null=True)
    username = models.CharField(max_length=30, unique=True)
    password = models.CharField(max_length=128)
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
    unit_id = models.CharField(primary_key=True, max_length=10, unique=True, default='AB1')
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
    
class Contract(models.Model):
    contract_id = models.CharField(primary_key=True, max_length=10, unique=True, default='CO1')
    tenant_name = models.ForeignKey(Tenant, on_delete=models.CASCADE)
    unit_id = models.ForeignKey(Unit, on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    contract_image = models.FileField(upload_to='contract_images/', null=True, blank=True)

    def __str__(self):
        return f"Contract {self.contract_id} - {self.tenant_name} - {self.unit_id}"
    
class Payment(models.Model):
    payment_id = models.CharField(primary_key=True, max_length=10, unique=True, default='PY1')
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField()
    contract_id = models.ForeignKey(Contract, on_delete=models.CASCADE)
    payment_method = models.CharField(max_length=20, choices=[
        ('mpesa', 'Mpesa'),
        ('bank', 'Bank'),
        ('cash', 'Cash'),
    ])
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Payment {self.payment_id} - Contract {self.contract_id}"

