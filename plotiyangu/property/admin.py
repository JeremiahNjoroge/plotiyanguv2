from django.contrib import admin
from .models import Tenant,Caretaker,Property,Unit,Contract,Payment,CustomUser


class TenantAdmin(admin.ModelAdmin):
    list_display = ('tenant_id', 'first_name', 'last_name', 'email', 'phone', 'intake_date', 'active')
    search_fields = ('tenant_id', 'first_name', 'last_name', 'email', 'phone', 'username')

class CaretakerAdmin(admin.ModelAdmin):
    list_display = ('caretaker_id', 'first_name', 'last_name', 'email', 'phone', 'hire_date', 'active')
    search_fields = ('caretaker_id', 'first_name', 'last_name', 'email', 'phone', 'username')

class PropertyAdmin(admin.ModelAdmin):
    list_display = ('property_id', 'property_name', 'location', 'active', 'created_at')
    search_fields = ('property_id', 'property_name', 'location')

class UnitAdmin(admin.ModelAdmin):
    list_display = ('unit_id', 'description', 'unit_type', 'rent_amount', 'active', 'property_name', 'created_at')
    search_fields = ('unit_id', 'description', 'property_name__property_name')

class ContractAdmin(admin.ModelAdmin):
    list_display = ('contract_id', 'tenant_name', 'unit_id', 'start_date', 'end_date', 'created_at')
    search_fields = ('contract_id', 'tenant_name__username', 'unit_id__unit_id')

class PaymentAdmin(admin.ModelAdmin):
    list_display = ('payment_id', 'amount', 'date', 'contract_id', 'payment_method', 'created_at')
    search_fields = ('payment_id', 'contract_id__contract_id')

class CustomUserAdmin(admin.ModelAdmin):
    list_display = ('username', 'email', 'first_name', 'last_name', 'user_type', 'is_staff', 'is_active')  
admin.site.register(Tenant, TenantAdmin)
admin.site.register(Caretaker, CaretakerAdmin)
admin.site.register(Property, PropertyAdmin)
admin.site.register(Unit, UnitAdmin)
admin.site.register(Contract, ContractAdmin)
admin.site.register(Payment, PaymentAdmin)
admin.site.register(CustomUser, CustomUserAdmin)