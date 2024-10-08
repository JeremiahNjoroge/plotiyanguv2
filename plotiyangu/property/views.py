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
<<<<<<< HEAD
<<<<<<< HEAD
from django.template.loader import render_to_string
from django.conf import settings
import pdfkit
from django.http import HttpResponse
from django.views.decorators.http import require_POST
from .decorators import landlord_required, tenant_required
from datetime import datetime
from django.db.models import Sum, F, ExpressionWrapper, DecimalField, Value
=======
=======
import urllib
from django.urls import reverse_lazy
from urllib.parse import urlencode
from django.db import IntegrityError
>>>>>>> development
from .decorators import landlord_required,tenant_required
<<<<<<< HEAD
>>>>>>> development
=======
from django.db.models import Sum, F, ExpressionWrapper, DecimalField
<<<<<<< HEAD
>>>>>>> development
=======
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils.html import strip_tags
>>>>>>> development

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
<<<<<<< HEAD
            error_message = "Invalid username or password."
            messages.error(request, error_message)
=======
            error_message = "Invalid Email or password."
>>>>>>> development
            return render(request, 'login.html', {'error_message': error_message})
    else:
        return render(request, 'login.html')

@login_required
def logout_user(request):
    """
    View function to handle user logout.
    """
    logout(request)
    return redirect('login')

@landlord_required
@login_required
@landlord_required
def landlord_dashboard(request):
    """
    View function for the landlord dashboard.
    """
    # Logic to fetch data for the landlord dashboard
    notification_count = count_landlord_notifications()  # Function to count notifications
    return render(request, 'landlord_dashboard.html', {'notification_count': notification_count})

@login_required
@landlord_required
def send_message(request):
    if request.method == 'POST':
        message = request.POST.get('message')

        # Construct message data
        message_data = {
            'sender': 'landlord',  # landlord is the sender
            'message': message
        }

        # Write message data to chat.json
        with open('chat.json', 'a') as file:
            json.dump(message_data, file)
            file.write('\n')

        # Redirect back to the chat form
        messages.success(request, 'Message sent successfully.')
        return HttpResponseRedirect(reverse('chat'))
    
    return render(request, 'chat.html')

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
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

@login_required
@tenant_required
def tenants_notifications(request):
    tenant_username = request.user.username
    tenant = Tenant.objects.get(username=tenant_username)
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
    
    return render(request, 'tenant_notifications.html', {'tenant_notifications_data': tenant_notifications_data,'tenant':tenant})

def count_tenant_notifications():
    file_path = 'chat.json'
    if not os.path.exists(file_path):
        return 0

    with open(file_path, 'r') as file:
        tenant_notifications = [json.loads(line) for line in file]

    return len(tenant_notifications)

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def property_list(request):
    """
    View function to display the list of properties.
    """
    properties = Property.objects.all()
    return render(request, 'property_list.html', {'properties': properties})
from django.shortcuts import render
from .models import Property, Unit

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
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

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def edit_property(request, property_id):
    """
    View function to edit a property.
    """
    property = get_object_or_404(Property, pk=property_id)
    if request.method == 'POST':
        form = PropertyForm(request.POST, request.FILES, instance=property)
        if form.is_valid():
            form.save()
            return redirect('property_detail', property_id=property.property_id)
    else:
        form = PropertyForm(instance=property)
    return render(request, 'edit_property.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def delete_property(request, property_id):
    """
    View function to delete a property.
    """
    property = get_object_or_404(Property, pk=property_id)
    if request.method == 'POST':
        property.delete()
        return redirect('landlord_dashboard')
    return render(request, 'delete_property.html', {'property': property})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def tenant_list(request):
    tenants = Tenant.objects.all()
    # Search by tenant ID or name
    search_query = request.GET.get('search')
    if search_query:
        tenants = tenants.filter(Q(tenant_id__icontains=search_query) | Q(username__icontains=search_query))    
    return render(request, 'tenant_list.html', {'tenants': tenants})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def add_tenant(request):
    if request.method == 'POST':
        form = TenantForm(request.POST, request.FILES)
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
                # Add success message
                messages.success(request, 'Tenant added successfully.')

                return redirect('tenant_list')

    else:
        form = TenantForm()
    
    return render(request, 'add_tenant.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def edit_tenant(request, tenant_id):
    tenant = get_object_or_404(Tenant, tenant_id=tenant_id)
    if request.method == 'POST':
        form = TenantForm(request.POST, request.FILES, instance=tenant )
        if form.is_valid():
            form.save()
            messages.success(request, 'Tenant edited successfully.')
            return redirect('tenant_list')
    else:
        form = TenantForm(instance=tenant)
    return render(request, 'edit_tenant.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def delete_tenant(request, tenant_id):
    tenant = get_object_or_404(Tenant, tenant_id=tenant_id)
    if request.method == 'POST':
        tenant.delete()
        messages.success(request, 'Tenant deleted successfully.')
        return redirect('tenant_list')
    return render(request, 'delete_tenant.html', {'tenant': tenant})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
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

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
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

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def add_unit(request):
    if request.method == 'POST':
        form = UnitForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Unit added successfully.')
            return redirect('unit_list')
    else:
        form = UnitForm()
    
    return render(request, 'add_unit.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def edit_unit(request, unit_id):
    unit = get_object_or_404(Unit, unit_id=unit_id)
    if request.method == 'POST':
        form = UnitForm(request.POST, instance=unit)
        if form.is_valid():
            form.save()
            messages.success(request, 'Unit edited successfully.')
            return redirect('unit_list')
    else:
        form = UnitForm(instance=unit)
    return render(request, 'edit_unit.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def delete_unit(request, unit_id):
    unit = get_object_or_404(Unit, unit_id=unit_id)
    if request.method == 'POST':
        unit.delete()
        messages.success(request, 'Unit deleted successfully.')
        return redirect('unit_list')
    return render(request, 'delete_unit.html', {'unit': unit})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def contract_list(request):
    contracts = Contract.objects.all()
    # Search by tenant ID or name
    search_query = request.GET.get('search')
    if search_query:
        contracts = contracts.filter(Q(contract_id__icontains=search_query))  
    return render(request, 'contract_list.html', {'contracts': contracts})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def add_contract(request):
    if request.method == 'POST':
        form = ContractForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Contract added successfully.')
            return redirect('contract_list')
    else:
        form = ContractForm()
    
    return render(request, 'add_contract.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def edit_contract(request, contract_id):
    contract = get_object_or_404(Contract, contract_id=contract_id)
    if request.method == 'POST':
        form = EditContractForm(request.POST, request.FILES, instance=contract)
        if form.is_valid():
            form.save()
            messages.success(request, 'Contract edited successfully.')
            return redirect('contract_list')
    else:
        form = EditContractForm(instance=contract)
    return render(request, 'edit_contract.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def delete_contract(request, contract_id):
    contract = get_object_or_404(Contract, contract_id=contract_id)
    if request.method == 'POST':
        contract.delete()
        messages.success(request, 'Contract deleted successfully.')
        return redirect('contract_list')
    return render(request, 'delete_contract.html', {'contract': contract})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def payment_list(request):
    payments = Payment.objects.all().order_by('-date')  # Sort payments by date in descending order
    search_query = request.GET.get('search')
    if search_query:
        payments = payments.filter(Q(payment_id__icontains=search_query))
    return render(request, 'payment_list.html', {'payments': payments})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def add_payment(request):
    if request.method == 'POST':
        form = PaymentForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Payment added successfully.')
            return redirect('payment_list')
    else:
        form = PaymentForm()
    
    return render(request, 'add_payment.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def edit_payment(request, payment_id):
    payment = get_object_or_404(Payment, payment_id=payment_id)
    if request.method == 'POST':
        form = PaymentForm(request.POST, instance=payment)
        if form.is_valid():
            form.save()
            messages.success(request, 'Payment edited successfully.')
            return redirect('payment_list')
    else:
        form = PaymentForm(instance=payment)
    return render(request, 'edit_payment.html', {'form': form})

<<<<<<< HEAD
@landlord_required
@login_required
=======
@login_required
@landlord_required
>>>>>>> development
def delete_payment(request, payment_id):
    payment = get_object_or_404(Payment, payment_id=payment_id)
    if request.method == 'POST':
        payment.delete()
        messages.success(request, 'Payment deleted successfully.')
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
        rent_due_value = contract.unit_id.rent_amount + rent_arrears

        # Get tenant's phone number
        whatsappphonenumber = contract.tenant_name.phone
        
        # Generate WhatsApp link
        whatsapp_message = f"Hello {contract.tenant_name},\n\n" \
                   f"This is a reminder regarding your rental payments for Contract ID: {contract.contract_id}.\n\n" \
                   f"Unit Type: *{contract.unit_id}*\n" \
                   f"Rent Arrears: *Kes.{rent_arrears}*\n" \
                   f"Next Month's Rent: *Kes.{rent_due_value}*\n\n" \
                   f"If you have any questions or concerns, feel free to contact me.\n\n" \
                   f"Thank you."
        
        urlencodedtext = urllib.parse.quote(whatsapp_message)

        whatsapp_link = f'https://wa.me/{whatsappphonenumber}/?text={urlencodedtext}'

        arrears.append({
            'contract': contract,
            'rent_arrears': rent_arrears,
            'total_rent_paid': total_payments,
            'rent_due_value': rent_due_value,
            'whatsapp_link': whatsapp_link
        })

    return render(request, 'payment_arrears.html', {'arrears': arrears})


@login_required
@tenant_required
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

@login_required
@tenant_required
def tenant_contract(request, contract_id):
    contract = get_object_or_404(Contract, pk=contract_id)
    tenant_username = request.user.username
    tenant = Tenant.objects.get(username=tenant_username)
    
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
    
    return render(request, 'tenant_contract.html', {'contract': contract,'tenant':tenant})

@login_required
@tenant_required
def tenant_payment(request, contract_id):
    contract = get_object_or_404(Contract, pk=contract_id)
    tenant_username = request.user.username
    tenant = Tenant.objects.get(username=tenant_username)
    
    if request.method == 'POST':
        # Extract payment details from the form
        amount = request.POST.get('amount')
        date = request.POST.get('date')
        payment_method = request.POST.get('payment_method')
        payment_reference_no = request.POST.get('payment_reference_no')
        
        try:
            # Create a Payment object and save it to the database
            payment = Payment.objects.create(
                amount=amount,
                date=date,
                contract_id=contract,
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

            # Send email to the tenant
            subject = 'Payment Confirmation'
            context = {
                'amount': amount,
                'date': date,
                'payment_method': payment_method,
                'payment_reference_no': payment_reference_no,
            }
            message = render_to_string('payment_email.html', context)
            plain_message = strip_tags(message)
            tenant_email = contract.tenant_name.email
            send_mail(subject, plain_message, 'jekanjoroge0809@gmail.com', [tenant_email], html_message=message)
            
            # Add a success message
            messages.success(request, 'Payment details submitted successfully')
            
            # Redirect back to the dashboard or any other desired page
            return HttpResponseRedirect(reverse('tenant_dashboard'))
        
        
        except IntegrityError as e:
            if 'UNIQUE constraint' in str(e):
                # Handle duplicate payment reference number
                messages.success(request, 'Invalid payment. Contact landlord.')
            else:
                # Handle other IntegrityError exceptions
                messages.success(request, 'An error occurred while processing the payment.')
    
    return render(request, 'tenant_payment.html', {'contract': contract,'tenant':tenant})
@login_required
@tenant_required
def generate_payment_statement(request, contract_id):
    tenant_username = request.user.username
    tenant = Tenant.objects.get(username=tenant_username)
    # Retrieve all payments related to the provided contract ID
    payments = Payment.objects.filter(contract_id=contract_id)

    # Get the contract details
    contract = get_object_or_404(Contract, pk=contract_id)

    #show monthly rent
    monthly_rent = contract.unit_id.rent_amount
    
    # Calculate total rent paid for the contract
    total_rent_paid = payments.aggregate(total_rent_paid=Sum('amount'))['total_rent_paid'] or 0
    
    # Calculate rent arrears
    rent_arrears = ExpressionWrapper(
        F('unit_id__rent_amount') - total_rent_paid,
        output_field=DecimalField(max_digits=10, decimal_places=2)
    )
<<<<<<< HEAD

    # Calculate overpayments
    overpayments = ExpressionWrapper(
        total_rent_paid - F('unit_id__rent_amount'),
        output_field=DecimalField(max_digits=10, decimal_places=2)
    )
<<<<<<< HEAD

    # Evaluate the expressions
    rent_arrears_value = Contract.objects.filter(pk=contract_id).annotate(rent_arrears=rent_arrears).values('rent_arrears').first()['rent_arrears']
    overpayments_value = Contract.objects.filter(pk=contract_id).annotate(overpayments=overpayments).values('overpayments').first()['overpayments']

    # Pass the payments data along with other calculated values to the template for rendering
    return render(request, 'payment_statement.html', {
        'payments': payments,
        'total_rent_paid': total_rent_paid,
        'rent_arrears': rent_arrears_value,
        'overpayments': overpayments_value,
        'contract': contract
    })
=======
>>>>>>> development

=======
    
>>>>>>> development
    # Evaluate the expressions
    rent_arrears_value = Contract.objects.filter(pk=contract_id).annotate(rent_arrears=rent_arrears).values('rent_arrears').first()['rent_arrears']

    # Calculate rent due for the next month
    rent_due_value = contract.unit_id.rent_amount + rent_arrears_value

    # Pass the payments data along with other calculated values to the template for rendering
    return render(request, 'payment_statement.html', {
        'payments': payments,
        'monthly_rent' : monthly_rent,
        'total_rent_paid': total_rent_paid,
        'rent_arrears': rent_arrears_value,
        'contract': contract,
        'rent_due_value':rent_due_value,
        'tenant':tenant
    })

@login_required
@tenant_required
def request_maintenance(request):
    # Retrieve the contract associated with the tenant
    tenant_username = request.user.username
    try:
        tenant = Tenant.objects.get(username=tenant_username)
        contract = Contract.objects.filter(tenant_name=tenant).first()  # Assuming one tenant has one contract
    except Tenant.DoesNotExist:
        return render(request, 'error.html', {'message': 'Tenant not found'})

    if request.method == 'POST':
        # Extract maintenance request details from the form
        unit_id = request.POST.get('unit_id')
        maintenance_type = request.POST.get('maintenance_type')
        
        # Create a maintenance request object and save it to the JSON file
        maintenance_request = {
            'unit_id': unit_id,
            'tenant_name': tenant.username,
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
    
    return render(request, 'request_maintenance.html', {'contract': contract,'tenant':tenant})