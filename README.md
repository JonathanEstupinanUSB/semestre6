th_app

UBI APP
Aplicacion movil desarrollada en Flutter, orientada a ofrecer una experiencia moderna, segura y dinamica.
Integra autenticacion de usuarios (tradicional y biometrica), almacenamiento seguro de tokens JWT y conexion con una API Flask.
Disenada con un estilo visual limpio y profesional en tonos azul oscuro y naranja, inspirados en la innovacion tecnologica aplicada al agro colombiano.
________________________________________
- Descripcion general
UBI APP es una aplicacion movil Flutter que permite:
- Registro e inicio de sesion de usuarios mediante credenciales (usuario y contrasena).
- Almacenamiento del token JWT de sesion usando flutter_secure_storage.
- Comunicacion con una API Flask REST para validar credenciales y gestionar usuarios.
- Interfaz moderna con fondo animado y diseno limpio, pensada para escalabilidad.
________________________________________
- Estructura de vistas
Pantalla    Ruta    Descripcion
Login   /login  Formulario de inicio de sesion. Solicita credenciales y valida con la API. Incluye autenticacion biometrica si esta disponible.
Registro    /register   Permite crear nuevos usuarios mediante API Flask.
Home    /home   Muestra mensaje de bienvenida, el token JWT almacenado y opcion de cerrar sesion.
________________________________________
-Seguridad y autenticacion
-Token JWT seguro
El token recibido desde la API Flask se almacena en el dispositivo con flutter_secure_storage, garantizando que otras aplicaciones no puedan acceder a el.
________________________________________
API utilizada
La app se conecta a la API Flask alojada en Railway:
Base URL:
https://flaskapiexample-production.up.railway.app/
Endpoint    Metodo  Descripcion
/users/register POST    Registrar nuevo usuario
/users/login    POST    Iniciar sesion y obtener token JWT
/users/ GET Obtener listado de usuarios (requiere JWT)
________________________________________
Ejecucion del proyecto
Requisitos previos
-   Flutter SDK 3.10 o superior
-   Android Studio o Visual Studio Code
-   Dispositivo fisico o emulador con soporte biometrico
Instalacion
git clone https://github.com/tuusuario/ubi_app.git
cd ubi_app
flutter pub get
flutter run
________________________________________
 Compatibilidad
    Android: Requiere que la actividad principal extienda de FlutterFragmentActivity.
________________________________________
Autor
UBI APP  Proyecto Flutter de autenticacion segura y diseno moderno
Desarrollado por [Proyecto integrador UBI-APP]
Enfocado en soluciones digitales para el agro colombiano.
