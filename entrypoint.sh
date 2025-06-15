#!/bin/bash

# Esperar a que la base de datos esté lista
echo "Esperando a que PostgreSQL esté listo..."
while ! pg_isready -h db -p 5432 -U django_user; do
  sleep 1
done

echo "PostgreSQL está listo!"

# Ejecutar migraciones
echo "Ejecutando migraciones..."
python manage.py makemigrations accounts
python manage.py makemigrations
python manage.py migrate

# Crear superusuario si no existe
echo "Creando superusuario..."
python manage.py shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123')
    print('Superusuario creado: admin/admin123')
else:
    print('Superusuario ya existe')
"

# Ejecutar el comando pasado como argumento
exec "$@"
