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
<<<<<<< HEAD
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
=======
      // Fondo con gradiente suave
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6D5DF6), Color(0xFF34D1BF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Encabezado
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                alignment: Alignment.center,
                child: const Text(
                  "Bienvenido",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: _jwt != null
                      ? Card(
                          elevation: 12,
                          shadowColor: Colors.black38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 28),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.verified, size: 80, color: Colors.teal.shade600),
                                const SizedBox(height: 20),
                                const Text(
                                  "¡Autenticado con éxito!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Tu token JWT:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: Colors.teal.shade200),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      _jwt!,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 28),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await AuthService().logout();
                                    if (!mounted) return;
                                    Navigator.pushReplacementNamed(context, '/login');
                                  },
                                  icon: const Icon(Icons.logout),
                                  label: const Text(
                                    "Cerrar sesión",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error_outline, size: 90, color: Colors.white70),
                            const SizedBox(height: 20),
                            const Text(
                              "No autenticado",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
>>>>>>> 41589dfd9180ae942b281e01137f87b185f66e1d
