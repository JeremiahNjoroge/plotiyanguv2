from .views import count_landlord_notifications, count_tenant_notifications

def notification_count(request):
    notification_count = count_landlord_notifications()
    return {'notification_count': notification_count}

def tenant_notification_count(request):
    notification_count = count_tenant_notifications()
    return {'tenant_notification_count': notification_count}