# Generated by Django 5.0.2 on 2024-04-17 10:49

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admin', '0003_logentry_add_action_flag_choices'),
        ('property', '0007_remove_tenant_last_login'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='CustomUser',
            new_name='LoginUser',
        ),
    ]
