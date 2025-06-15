# Django Hello World con Docker y PostgreSQL

Una aplicación Django moderna con autenticación de usuarios, dockerizada y con base de datos PostgreSQL.

## 🚀 Características

- **Django 5.2.3** con configuración moderna
- **PostgreSQL** como base de datos
- **Docker & Docker Compose** para desarrollo
- **Autenticación personalizada** con registro e inicio de sesión
- **Interfaz moderna** con Bootstrap 5
- **Volúmenes Docker** para desarrollo en tiempo real

## 📋 Requisitos

- Docker
- Docker Compose

## 🛠️ Instalación y Configuración

### 1. Clonar el repositorio

```bash
git clone <url-del-repositorio>
cd django
```

### 2. Construir y ejecutar los contenedores

```bash
docker-compose up --build
```

Este comando:
- Construye la imagen de Django
- Configura PostgreSQL
- Ejecuta las migraciones automáticamente
- Crea un superusuario (admin/admin123)
- Inicia el servidor de desarrollo

### 3. Acceder a la aplicación

- **Aplicación principal**: http://localhost:8080
- **Panel de administración**: http://localhost:8080/admin
  - Usuario: admin
  - Contraseña: admin123

## 🎯 Funcionalidades

### Autenticación
- **Registro de usuarios** (`/accounts/signup/`)
  - Nombre
  - Apellido  
  - Correo electrónico
  - Nombre de usuario
  - Contraseña

- **Inicio de sesión** (`/accounts/login/`)
- **Dashboard** personalizado (`/accounts/dashboard/`)
- **Cerrar sesión** (`/accounts/logout/`)

### Base de datos
- **PostgreSQL** ejecutándose en contenedor
- **Migraciones automáticas** al iniciar
- **Datos persistentes** con volúmenes Docker

## 🐳 Comandos Docker útiles

### Ejecutar migraciones manualmente
```bash
docker-compose exec web python manage.py makemigrations
docker-compose exec web python manage.py migrate
```

### Crear superusuario
```bash
docker-compose exec web python manage.py createsuperuser
```

### Acceder al shell de Django
```bash
docker-compose exec web python manage.py shell
```

### Acceder a PostgreSQL
```bash
docker-compose exec db psql -U django_user -d django_db
```

### Ver logs
```bash
# Todos los servicios
docker-compose logs

# Solo Django
docker-compose logs web

# Solo PostgreSQL
docker-compose logs db
```

### Detener los servicios
```bash
docker-compose down
```

### Detener y eliminar volúmenes
```bash
docker-compose down -v
```

## 📁 Estructura del Proyecto

```
django/
├── app/                    # Configuración principal de Django
│   ├── settings.py        # Configuración (PostgreSQL, templates, etc.)
│   ├── urls.py           # URLs principales
│   └── ...
├── accounts/              # Aplicación de autenticación
│   ├── models.py         # Modelo de usuario personalizado
│   ├── views.py          # Vistas de login/signup/dashboard
│   ├── forms.py          # Formularios personalizados
│   └── ...
├── templates/             # Templates HTML
│   ├── base.html         # Template base con Bootstrap
│   └── accounts/         # Templates de autenticación
├── static/               # Archivos estáticos
├── docker-compose.yml    # Configuración de servicios
├── Dockerfile           # Imagen de Django
├── requirements.txt     # Dependencias de Python
├── entrypoint.sh       # Script de inicialización
└── .env               # Variables de entorno
```

## 🔧 Configuración de Desarrollo

### Variables de entorno
El archivo `.env` contiene:
```
SECRET_KEY=tu-clave-secreta
DEBUG=True
POSTGRES_DB=django_db
POSTGRES_USER=django_user
POSTGRES_PASSWORD=django_password
POSTGRES_HOST=db
POSTGRES_PORT=5432
```

### Desarrollo en tiempo real
Los cambios en el código se reflejan automáticamente gracias a:
- Volúmenes Docker (`./:/app`)
- DEBUG=True en Django
- Servidor de desarrollo de Django

## 🎨 Interfaz de Usuario

- **Diseño moderno** con gradientes y glassmorphism
- **Bootstrap 5** para responsividad
- **Font Awesome** para iconos
- **Formularios estilizados** con validación visual
- **Dashboard intuitivo** con información del usuario

## 🔒 Seguridad

- Autenticación integrada de Django
- Validación de formularios
- Protección CSRF
- Modelo de usuario personalizado
- Variables de entorno para configuración sensible

## 📝 Notas adicionales

- Las migraciones se ejecutan automáticamente al iniciar
- Los datos de PostgreSQL son persistentes
- El superusuario se crea automáticamente
- El proyecto está configurado para desarrollo, no para producción

¡Tu aplicación Django está lista para usar! 🎉