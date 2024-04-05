from django.urls import path
from . import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns = [
    path('',views.home,name='home'),
    path('profile/', views.profile_edit, name='profile_edit'),  
    path('chat/', views.send_message, name='chat'),   
    path('login/', views.user_login, name='login'),
    path('logout/', views.logout_user, name='logout'), 
    path('landlord-dashboard/', views.landlord_dashboard, name='landlord_dashboard'),
    path('landlord-notifications/', views.landlord_notifications, name='landlord_notifications'),
    path('properties/', views.property_list, name='property_list'),
    path('property/<str:property_id>/', views.property_detail, name='property_detail'),    
    path('property/<str:property_id>/edit/', views.edit_property, name='edit_property'),
    path('property/<str:property_id>/delete/', views.delete_property, name='delete_property'),
    path('tenants/', views.tenant_list, name='tenant_list'),
    path('add_tenant/', views.add_tenant, name='add_tenant'),
    path('edit_tenant/<str:tenant_id>/', views.edit_tenant, name='edit_tenant'),
    path('delete_tenant/<str:tenant_id>/', views.delete_tenant, name='delete_tenant'),
    path('tenant/<str:tenant_id>/', views.tenant_detail, name='tenant_detail'),    
    path('units/', views.unit_list, name='unit_list'),
    path('add_unit/', views.add_unit, name='add_unit'),
    path('edit_unit/<str:unit_id>/', views.edit_unit, name='edit_unit'),
    path('delete_unit/<str:unit_id>/', views.delete_unit, name='delete_unit'),
    path('contracts/', views.contract_list, name='contract_list'),
    path('add_contract/', views.add_contract, name='add_contract'),
    path('edit_contract/<str:contract_id>/', views.edit_contract, name='edit_contract'),
    path('delete_contract/<str:contract_id>/', views.delete_contract, name='delete_contract'),
    path('payments/', views.payment_list, name='payment_list'),
    path('add_payment/', views.add_payment, name='add_payment'),
    path('edit_payment/<str:payment_id>/', views.edit_payment, name='edit_payment'),
    path('delete_payment/<str:payment_id>/', views.delete_payment, name='delete_payment'),  
    path('payment-arrears/', views.payment_arrears, name='payment_arrears'), 
    path('tenant-dashboard/', views.tenant_dashboard, name='tenant_dashboard'),
    path('tenant_contract/<str:contract_id>/', views.tenant_contract, name='tenant_contract'),
    path('tenant_payment/<str:contract_id>/', views.tenant_payment, name='tenant_payment'),
    path('tenant_notifications/', views.tenants_notifications, name='tenant_notifications'),
    path('generate-payment-statement/<str:contract_id>/', views.generate_payment_statement, name='generate_payment_statement'),
    path('request-maintenance/', views.request_maintenance, name='request_maintenance'),
    ] 
# Serving static files
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

# Serving media files
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)