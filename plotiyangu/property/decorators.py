from django.shortcuts import redirect, render
from django.contrib import messages

def landlord_required(view_func):
    """
    Decorator function to check if the user is a landlord.
    """
    def wrapper(request, *args, **kwargs):
        if request.user.is_authenticated:
            if request.user.user_type == 'landlord':
                # User is authenticated and is a landlord, allow access to the view
                return view_func(request, *args, **kwargs)
            else:
                # User is authenticated but not a landlord, redirect to login and show message
                messages.error(request, "You don't have landlord access.")
                return redirect('login')  # Redirect to the login page
        else:
            # User is not authenticated, redirect to login and show message
            messages.add_message(request, messages.INFO, "You must be a landlord to access this page!")
            return redirect('login')  # Redirect to the login page
    return wrapper

def tenant_required(view_func):
    """
    Decorator function to check if the user is a tenant.
    """
    def wrapper(request, *args, **kwargs):
        if request.user.is_authenticated and request.user.user_type == 'tenant':
            # User is authenticated and is a tenant, allow access to the view
            return view_func(request, *args, **kwargs)
        else:
            # User is not authenticated or is not a tenant, redirect to login or another page
            return redirect('login')  # Redirect to the login page or any other appropriate page
    return wrapper