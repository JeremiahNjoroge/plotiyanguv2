from django.contrib import admin

# Register your models here.
from .models import Tenant,Caretaker,Property,Unit,Contract,Payment
admin.site.register(Tenant)
admin.site.register(Caretaker)
admin.site.register(Property)
admin.site.register(Unit)
admin.site.register(Contract)
admin.site.register(Payment)
