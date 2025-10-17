import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _jwt;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final token = await AuthService().getToken();
    setState(() {
      _jwt = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
        child: _jwt != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¡Usuario autenticado exitosamente!'),
                  const SizedBox(height: 20),
                  Text('Token JWT:'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_jwt!, style: const TextStyle(fontSize: 12)),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await AuthService().logout();
                      if (!mounted) return;
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text('Cerrar sesión'),
                  ),
                ],
              )
            : const Text('No autenticado'),
      ),
    );
  }
}