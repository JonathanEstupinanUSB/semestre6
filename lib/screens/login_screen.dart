import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final LocalAuthentication _localAuth = LocalAuthentication();
  String? _error;

  Future<void> _login() async {
    if (_formKey.currentState?.validate() != true) return;
    final token = await _authService.login(
      _usernameController.text,
      _passwordController.text,
    );
    if (token != null) {
      // Autenticación biométrica
      final didAuth = await _localAuth.authenticate(
        localizedReason: 'Autentícate para acceder',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (didAuth) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() => _error = 'Autenticación biométrica fallida');
      }
    } else {
      setState(() => _error = 'Usuario o contraseña incorrectos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.agriculture,
                size: 80, color: Colors.orangeAccent),
            const SizedBox(height: 10),
            Text(
              "Bienvenido a Ubi App",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Formulario
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      prefixIcon: Icon(Icons.person, color: Colors.blue.shade900),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Campo requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock, color: Colors.blue.shade900),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    obscureText: true,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Campo requerido' : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Iniciar sesión',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: Text(
                      '¿No tienes cuenta? Regístrate',
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                  ),
                  if (_error != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        _error!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
