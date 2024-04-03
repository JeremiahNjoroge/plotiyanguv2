# forms.py

from django import forms
from .models import Property, Tenant, Unit, Contract, Payment


class PropertyForm(forms.ModelForm):
    class Meta:
        model = Property
        fields = '__all__'  # You can specify specific fields if needed

class TenantForm(forms.ModelForm):
    class Meta:
        model = Tenant
        fields = ['first_name', 'last_name', 'username', 'email', 'phone', 'description', 'profile_pic' ]

class UnitForm(forms.ModelForm):
    class Meta:
        model = Unit
        fields = ['description', 'unit_type', 'rent_amount', 'property_name', 'active']

class ContractForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = ['tenant_name', 'unit_id', 'start_date', 'end_date', 'contract_image']
        widgets = {
            'start_date': forms.DateInput(attrs={'type': 'date'}),
            'end_date': forms.DateInput(attrs={'type': 'date'}),
        }

    def clean(self):
        cleaned_data = super().clean()
        unit_id = cleaned_data.get('unit_id')
        tenant_name = cleaned_data.get('tenant_name')

        # Check if the unit is already assigned to another tenant's contract
        existing_contract = Contract.objects.filter(unit_id=unit_id).first()
        if existing_contract:
            raise forms.ValidationError("This unit is already assigned to another tenant's contract.")

        # Check if the tenant already has an active contract
        existing_contract = Contract.objects.filter(tenant_name=tenant_name).first()
        if existing_contract:
            raise forms.ValidationError("This tenant already has an active contract for another unit.")

        return cleaned_data
    
class EditContractForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = ['tenant_name', 'unit_id', 'start_date', 'end_date', 'contract_image']

    def clean(self):
        cleaned_data = super().clean()
        # Exclude validation for unit_id and tenant_name
        return cleaned_data

class PaymentForm(forms.ModelForm):
    class Meta:
        model = Payment
        fields = ['amount', 'date', 'contract_id', 'payment_method', 'payment_reference_no']
        widgets = {
            'date': forms.DateInput(attrs={'type': 'date'}),
        }
        