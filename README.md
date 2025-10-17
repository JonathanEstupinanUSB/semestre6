<<<<<<< HEAD
# ubbi_auth_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# VideoApp

Aplicación Flutter con autenticación biométrica y almacenamiento seguro de token JWT.

## Descripción

Este proyecto es una app Flutter que permite:
- Registro de usuario (usuario y contraseña) contra una API Flask.
- Login de usuario con autenticación biométrica (huella, rostro, etc.) en Android.
- Almacenamiento seguro del token JWT usando `flutter_secure_storage`.
- Pantalla principal que muestra un mensaje y el token JWT si el usuario está autenticado.

## Estructura de vistas

- **Login** (`/login`):
  - Formulario para usuario y contraseña.
  - Al iniciar sesión, solicita autenticación biométrica.
  - Si es exitosa, almacena el JWT y navega a la pantalla principal.

- **Registro** (`/register`):
  - Formulario para crear un nuevo usuario.
  - Permite registrar usuario y contraseña en la API.

- **Home** (`/home`):
  - Muestra mensaje de bienvenida si el usuario está autenticado.
  - Muestra el token JWT almacenado.
  - Permite cerrar sesión (elimina el JWT).

## Almacenamiento del token JWT

El token JWT se almacena de forma segura en el dispositivo usando el paquete [`flutter_secure_storage`](https://pub.dev/packages/flutter_secure_storage). Esto garantiza que el token no sea accesible por otras apps y se protege con mecanismos del sistema operativo.

## Autenticación biométrica

La app utiliza el paquete [`local_auth`](https://pub.dev/packages/local_auth) para solicitar autenticación biométrica (huella, rostro, etc.) antes de acceder a la pantalla principal.

## API utilizada

La app se conecta a la API Flask:
[https://flaskapiexample-production.up.railway.app/](https://flaskapiexample-production.up.railway.app/)

- **Registro:** `POST /users/register`
- **Login:** `POST /users/login`
- **Listado de usuarios:** `GET /users/` (requiere JWT)


<img width="1071" height="681" alt="Untitled Diagram drawio" src="https://github.com/user-attachments/assets/d7143677-2ed9-4877-b80b-8dbc8c246867" />

## Requisitos

- Flutter 3.x
- Android: la actividad principal debe extender de `FlutterFragmentActivity` para soportar biometría.

## Instalación y ejecución

1. Clona el repositorio.
2. Ejecuta `flutter pub get` para instalar dependencias.
3. Ejecuta en Android:
   ```sh
   flutter run
   ```

## Notas
- El token JWT se elimina al cerrar sesión.
- Si la autenticación biométrica falla, el usuario no accede a la pantalla principal.
- El almacenamiento seguro solo está disponible en dispositivos reales (no en emuladores sin soporte biométrico).
>>>>>>> 41589dfd9180ae942b281e01137f87b185f66e1d
