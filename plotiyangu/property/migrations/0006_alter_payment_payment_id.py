# Generated by Django 5.0.2 on 2024-03-23 12:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('property', '0005_alter_contract_created_at'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='payment_id',
            field=models.CharField(editable=False, max_length=10, primary_key=True, serialize=False, unique=True),
        ),
    ]
