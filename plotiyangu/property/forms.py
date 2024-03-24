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
        fields = ['description', 'unit_type', 'rent_amount', 'property_name']

class ContractForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = ['tenant_name', 'unit_id', 'start_date', 'end_date', 'contract_image']
    def clean_unit_id(self):
        unit_id = self.cleaned_data.get('unit_id')
        existing_contract = Contract.objects.filter(unit_id=unit_id).first()
        if existing_contract:
            raise forms.ValidationError("This unit is already assigned to another tenant's contract.")
        return unit_id
    
class PaymentForm(forms.ModelForm):
    class Meta:
        model = Payment
        fields = ['amount', 'date', 'contract_id', 'payment_method', 'payment_reference_no']