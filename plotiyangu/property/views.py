from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect, get_object_or_404
from .models import Property, Tenant, Unit, Contract, Payment, CustomUser
from .forms import PropertyForm, TenantForm, UnitForm, ContractForm, PaymentForm, EditContractForm
from django.contrib.auth.decorators import login_required
from django.db.models import Q, Sum
from django.contrib.auth.hashers import make_password
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib import messages
from django.urls import reverse
from django.http import HttpResponseRedirect
import json
import os
from .decorators import landlord_required,tenant_required

def home(request):
    return render(request, 'index.html')

@login_required
def profile_edit(request):
    if request.method == 'POST':
        # Handle password change form submission
        password_form = PasswordChangeForm(request.user, request.POST)
        if password_form.is_valid():
            user = password_form.save()
            update_session_auth_hash(request, user)  # Update session to prevent log out
            messages.success(request, 'Your password was successfully updated!')
            return redirect('tenant_dashboard')
        else:
            messages.error(request, 'Please correct the error below.')

    else:
        password_form = PasswordChangeForm(request.user)

    return render(request, 'profile_edit.html', {
        'password_form': password_form,
    })

def user_login(request):
    """
    View function to handle user login.
    """
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            if user.user_type == 'tenant':
                return redirect('tenant_dashboard')
            elif user.user_type == 'landlord':
                return redirect('landlord_dashboard')
            elif user.is_superuser:
                return redirect('admin')
        else:
            error_message = "Invalid username or password."
            return render(request, 'login.html', {'error_message': error_message})
    else:
        return render(request, 'login.html')

def logout_user(request):
    """
    View function to handle user logout.
    """
    logout(request)
    return redirect('login')

@login_required
def landlord_dashboard(request):
    """
    View function for the landlord dashboard.
    """
    # Logic to fetch data for the landlord dashboard
    notification_count = count_landlord_notifications()  # Function to count notifications
    return render(request, 'landlord_dashboard.html', {'notification_count': notification_count})

def send_message(request):
    if request.method == 'POST':
        message = request.POST.get('message')

        # Construct message data
        message_data = {
            'sender': 'landlord',  # Assuming the landlord is the sender
            'message': message
        }

        # Write message data to chat.json
        with open('chat.json', 'a') as file:
            json.dump(message_data, file)
            file.write('\n')

        # Redirect back to the chat form
        return HttpResponseRedirect(reverse('chat'))
    
    return render(request, 'chat.html')

def landlord_notifications(request):
    # Check if the file exists
    file_path = 'notifications.json'
    if not os.path.exists(file_path):
        return render(request, 'landlord_notifications.html', {'notifications_data': []})
    
    # Read the JSON file to get notifications
    with open(file_path, 'r') as file:
        notifications = [json.loads(line) for line in file]
    
    notifications_data = []
    for notification in notifications:
        if 'action' in notification:
            # Notification is for contract action
            contract = Contract.objects.get(pk=notification['contract_id'])
            notifications_data.append({'type': 'contract', 'contract': contract, 'action': notification['action'], 'reason': notification.get('reason', '')})
        elif 'payment_id' in notification:
            # Notification is for payment
            contract = Contract.objects.get(pk=notification['contract_id'])
            notifications_data.append({'type': 'payment', 'contract': contract, 'payment_id': notification['payment_id'], 'amount': notification['amount'], 'date': notification['date'], 'payment_method': notification['payment_method'], 'payment_reference_no': notification['payment_reference_no']})
        elif 'unit_id' in notification:
            # Notification is for maintenance
            tenant_name = notification['tenant_name']
            unit_id = notification['unit_id']
            maintenance_type = notification['maintenance_type']
            notifications_data.append({'type': 'maintenance', 'tenant_name': tenant_name, 'unit_id': unit_id, 'maintenance_type': maintenance_type})
    
    return render(request, 'landlord_notifications.html', {'notifications_data': notifications_data})


def count_landlord_notifications():
    file_path = 'notifications.json'
    if not os.path.exists(file_path):
        return 0

    with open(file_path, 'r') as file:
        notifications = [json.loads(line) for line in file]

    return len(notifications)  

def tenants_notifications(request):
    # Check if the file exists
    file_path = 'chat.json'
    if not os.path.exists(file_path):
        return render(request, 'tenant_notifications.html', {'tenant_notifications_data': []})
    
    # Read the JSON file to get notifications
    with open(file_path, 'r') as file:
        chat_messages = [json.loads(line) for line in file]
    
    tenant_notifications_data = []
    for message in chat_messages:
        sender = message.get('sender')
        if sender == 'landlord':
            tenant_notifications_data.append({
                'type': 'message',
                'sender': sender,
                'message': message.get('message')
            })
    
    return render(request, 'tenant_notifications.html', {'tenant_notifications_data': tenant_notifications_data})

def count_tenant_notifications():
    file_path = 'chat.json'
    if not os.path.exists(file_path):
        return 0

    with open(file_path, 'r') as file:
        tenant_notifications = [json.loads(line) for line in file]

    return len(tenant_notifications)

def property_list(request):
    """
    View function to display the list of properties.
    """
    properties = Property.objects.all()
    return render(request, 'property_list.html', {'properties': properties})
from django.shortcuts import render
from .models import Property, Unit
def property_detail(request, property_id):
    try:
        # Retrieve the property object
        property = Property.objects.get(property_id=property_id)

        # Retrieve units associated with the property
        units = Unit.objects.filter(property_name=property)
        contracts = Contract.objects.filter(unit_id__in=units)
        unique_tenants = contracts.values('tenant_name').distinct().count()

        # Calculate metrics
        total_units = units.count()  # Count the units associated with the property
        vacant_units = units.filter(active=True).count()
        occupied_units = units.filter(active=False).count()

        # Calculate total payments associated with the property
        total_payments = Payment.objects.filter(contract_id__unit_id__property_name=property) \
            .aggregate(total=Sum('amount'))['total'] or 0  # Aggregate the sum of payments or 0 if None

        # Render the template with the property object, units, and calculated metrics
        return render(request, 'property_detail.html', {
            'property': property,
            'units': units,
            'total_units': total_units,
            'vacant_units': vacant_units,
            'occupied_units': occupied_units,
            'unique_tenants': unique_tenants,  # Add count of unique tenants
            'total_payments': total_payments,  # Add total payments associated with the property
        })
    except Property.DoesNotExist:
        # Handle the case where the property does not exist
        return render(request, 'property_not_found.html')

def edit_property(request, property_id):
    """
    View function to edit a property.
    """
    property = get_object_or_404(Property, pk=property_id)
    if request.method == 'POST':
        form = PropertyForm(request.POST, instance=property)
        if form.is_valid():
            form.save()
            return redirect('property_detail', property_id=property.property_id)
    else:
        form = PropertyForm(instance=property)
    return render(request, 'edit_property.html', {'form': form})

def delete_property(request, property_id):
    """
    View function to delete a property.
    """
    property = get_object_or_404(Property, pk=property_id)
    if request.method == 'POST':
        property.delete()
        return redirect('landlord_dashboard')
    return render(request, 'delete_property.html', {'property': property})

def tenant_list(request):
    tenants = Tenant.objects.all()
    # Search by tenant ID or name
    search_query = request.GET.get('search')
    if search_query:
        tenants = tenants.filter(Q(tenant_id__icontains=search_query) | Q(username__icontains=search_query))    
    return render(request, 'tenant_list.html', {'tenants': tenants})

def add_tenant(request):
    if request.method == 'POST':
        form = TenantForm(request.POST)
        if form.is_valid():
            # Check if the username already exists
            username = form.cleaned_data['username']
            if CustomUser.objects.filter(username=username).exists():
                form.add_error('username', 'This username is already taken. Please choose a different one.')
            else:
                # Create CustomUser instance with user_type=tenant and default password 'tenant'
                user_data = form.cleaned_data
                email = user_data['email']
                password = make_password('tenant')  # Hash default password
                CustomUser.objects.create(username=username, email=email, password=password, user_type='tenant')

                # Create Tenant instance
                form.save()

                return redirect('tenant_list')
    else:
        form = TenantForm()
    
    return render(request, 'add_tenant.html', {'form': form})

def edit_tenant(request, tenant_id):
    tenant = get_object_or_404(Tenant, tenant_id=tenant_id)
    if request.method == 'POST':
        form = TenantForm(request.POST, instance=tenant)
        if form.is_valid():
            form.save()
            return redirect('tenant_list')
    else:
        form = TenantForm(instance=tenant)
    return render(request, 'edit_tenant.html', {'form': form})

def delete_tenant(request, tenant_id):
    tenant = get_object_or_404(Tenant, tenant_id=tenant_id)
    if request.method == 'POST':
        tenant.delete()
        return redirect('tenant_list')
    return render(request, 'delete_tenant.html', {'tenant': tenant})

def tenant_detail(request, tenant_id):
    # Fetch the tenant object
    tenant = get_object_or_404(Tenant, tenant_id=tenant_id)

    # Fetch all contracts associated with the tenant
    contracts = Contract.objects.filter(tenant_name=tenant)

    # Fetch all payments associated with the tenant's contracts
    payments = Payment.objects.filter(contract_id__in=contracts)

    return render(request, 'tenant_detail.html', {
        'tenant': tenant,
        'contracts': contracts,
        'payments': payments,
    })

def unit_list(request):
    units = Unit.objects.all()

    # Filter units based on query parameters
    status_filter = request.GET.get('status')
    if status_filter:
        if status_filter == 'occupied':
            units = units.filter(active=False)
        elif status_filter == 'vacant':
            units = units.filter(active=True)

    # Search by unit ID
    search_query = request.GET.get('search')
    if search_query:
        units = units.filter(unit_id__icontains=search_query)

    return render(request, 'unit_list.html', {'units': units})

def add_unit(request):
    if request.method == 'POST':
        form = UnitForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('unit_list')
    else:
        form = UnitForm()
    
    return render(request, 'add_unit.html', {'form': form})

def edit_unit(request, unit_id):
    unit = get_object_or_404(Unit, unit_id=unit_id)
    if request.method == 'POST':
        form = UnitForm(request.POST, instance=unit)
        if form.is_valid():
            form.save()
            return redirect('unit_list')
    else:
        form = UnitForm(instance=unit)
    return render(request, 'edit_unit.html', {'form': form})

def delete_unit(request, unit_id):
    unit = get_object_or_404(Unit, unit_id=unit_id)
    if request.method == 'POST':
        unit.delete()
        return redirect('unit_list')
    return render(request, 'delete_unit.html', {'unit': unit})

def contract_list(request):
    contracts = Contract.objects.all()
    return render(request, 'contract_list.html', {'contracts': contracts})

def add_contract(request):
    if request.method == 'POST':
        form = ContractForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('contract_list')
    else:
        form = ContractForm()
    
    return render(request, 'add_contract.html', {'form': form})


def edit_contract(request, contract_id):
    contract = get_object_or_404(Contract, contract_id=contract_id)
    if request.method == 'POST':
        form = EditContractForm(request.POST, instance=contract)
        if form.is_valid():
            form.save()
            return redirect('contract_list')
    else:
        form = EditContractForm(instance=contract)
    return render(request, 'edit_contract.html', {'form': form})

def delete_contract(request, contract_id):
    contract = get_object_or_404(Contract, contract_id=contract_id)
    if request.method == 'POST':
        contract.delete()
        return redirect('contract_list')
    return render(request, 'delete_contract.html', {'contract': contract})

def payment_list(request):
    payments = Payment.objects.all()
    return render(request, 'payment_list.html', {'payments': payments})

def add_payment(request):
    if request.method == 'POST':
        form = PaymentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('payment_list')
    else:
        form = PaymentForm()
    
    return render(request, 'add_payment.html', {'form': form})

def edit_payment(request, payment_id):
    payment = get_object_or_404(Payment, payment_id=payment_id)
    if request.method == 'POST':
        form = PaymentForm(request.POST, instance=payment)
        if form.is_valid():
            form.save()
            return redirect('payment_list')
    else:
        form = PaymentForm(instance=payment)
    return render(request, 'edit_payment.html', {'form': form})

def delete_payment(request, payment_id):
    payment = get_object_or_404(Payment, payment_id=payment_id)
    if request.method == 'POST':
        payment.delete()
        return redirect('payment_list')
    return render(request, 'delete_payment.html', {'payment': payment})

@landlord_required
@login_required
def payment_arrears(request):
    contracts = Contract.objects.all()
    arrears = []

    for contract in contracts:
        payments = Payment.objects.filter(contract_id=contract)
        total_payments = payments.aggregate(Sum('amount'))['amount__sum'] or 0
        rent_arrears = contract.unit_id.rent_amount - total_payments
        arrears.append({
            'contract': contract,
            'rent_arrears': rent_arrears,
            'total_rent_paid': total_payments
        })

    return render(request, 'payment_arrears.html', {'arrears': arrears})

@login_required
def tenant_dashboard(request):
    """
    View function for the tenant dashboard.
    """
    # Retrieve the logged-in tenant
    tenant_username = request.user.username
    try:
        tenant = Tenant.objects.get(username=tenant_username)
    except Tenant.DoesNotExist:
        # Handle the case where the tenant does not exist
        # You can customize this based on your project's requirements
        return render(request, 'error.html', {'message': 'Tenant not found'})

    # Retrieve contracts associated with the tenant
    contracts = Contract.objects.filter(tenant_name=tenant)

    # Retrieve payment history for the tenant
    payments = Payment.objects.filter(contract_id__in=contracts)


    # Render the tenant dashboard template with the required context
    return render(request, 'tenant_dashboard.html', {
        'tenant': tenant,
        'contracts': contracts,
        'payments': payments,
    })

def tenant_contract(request, contract_id):
    contract = get_object_or_404(Contract, pk=contract_id)
    
    if request.method == 'POST':
        action = request.POST.get('action')
        reason = request.POST.get('renewal_reason' if action == 'renewal' else 'termination_reason')
        
        # Save the request data in a JSON file
        with open('notifications.json', 'a') as file:
            request_data = {'contract_id': contract_id, 'action': action, 'reason': reason}
            json.dump(request_data, file)
            file.write('\n')
        
                # Add a success message
        messages.success(request, 'Request submitted successfully')
        
        # Redirect back to the dashboard
        return HttpResponseRedirect(reverse('tenant_dashboard'))
    
    return render(request, 'tenant_contract.html', {'contract': contract})

def tenant_payment(request, contract_id):
    contract = get_object_or_404(Contract, pk=contract_id)
    
    if request.method == 'POST':
        # Extract payment details from the form
        amount = request.POST.get('amount')
        date = request.POST.get('date')
        payment_method = request.POST.get('payment_method')
        payment_reference_no = request.POST.get('payment_reference_no')
        
        # Create a Payment object and save it to the database
        payment = Payment.objects.create(
            amount=amount,
            date=date,
            contract_id=contract,  # Use contract_id instead of contract
            payment_method=payment_method,
            payment_reference_no=payment_reference_no
        )
        
        # Save the payment details in a JSON file
        with open('notifications.json', 'a') as file:
            payment_data = {
                'payment_id': payment.payment_id,
                'amount': amount,
                'date': date,
                'contract_id': contract_id,
                'payment_method': payment_method,
                'payment_reference_no': payment_reference_no
            }
            json.dump(payment_data, file)
            file.write('\n')
        
        # Add a success message
        messages.success(request, 'Payment details submitted successfully')
        
        # Redirect back to the dashboard or any other desired page
        return HttpResponseRedirect(reverse('tenant_dashboard'))
    
    return render(request, 'tenant_payment.html', {'contract': contract})

def generate_payment_statement(request, contract_id):
    # Retrieve all payments related to the provided contract ID
    payments = Payment.objects.filter(contract_id=contract_id)

    # Pass the payments data to the template for rendering
    return render(request, 'payment_statement.html', {'payments': payments})


def request_maintenance(request):
    # Retrieve the contract associated with the provided contract_id
    
    if request.method == 'POST':
        # Extract maintenance request details from the form
        unit_id = request.POST.get('unit_id')
        tenant_name = request.POST.get('tenant_name')
        maintenance_type = request.POST.get('maintenance_type')
        
        # Create a maintenance request object and save it to the JSON file
        maintenance_request = {
            'unit_id': unit_id,
            'tenant_name': tenant_name,
            'maintenance_type': maintenance_type
        }
        
        # Save the maintenance request details in the notifications.json file
        with open('notifications.json', 'a') as file:
            json.dump(maintenance_request, file)
            file.write('\n')
        
        # Add a success message
        messages.success(request, 'Maintenance request submitted successfully')
        
        # Redirect back to the dashboard or any other desired page
        return HttpResponseRedirect(reverse('tenant_dashboard'))
    
    return render(request, 'request_maintenance.html')