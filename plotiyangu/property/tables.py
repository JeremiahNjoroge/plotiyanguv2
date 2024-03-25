# tables.py

import django_tables2 as tables
from .models import Property

class PropertyTable(tables.Table):
    class Meta:
        model = Property
        template_name = 'django_tables2/bootstrap4.html'  # Use Bootstrap 4 styling (optional)
        fields = ('property_id', 'property_name', 'location')  # Specify the fields to include in the table
        attrs = {'class': 'table table-striped'}  # Apply Bootstrap table classes (optional)
