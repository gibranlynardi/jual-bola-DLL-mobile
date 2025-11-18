import 'package:jual_bola_dll/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:jual_bola_dll/screens/register.dart';

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
            ),
            body: Center(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 30.0),
                                TextField(
                                    controller: _usernameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Username',
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.person),
                                    ),
                                ),
                                const SizedBox(height: 12.0),
                                TextField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.lock),
                                    ),
                                    obscureText: true,
                                ),
                                const SizedBox(height: 24.0),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed: () async {
                                        String username = _usernameController.text;
                                        String password = _passwordController.text;

                                        // URL endpoint Login Django
                                        // Gunakan 10.0.2.2 untuk Android Emulator
                                        // Gunakan 127.0.0.1 untuk Web / iOS Simulator
                                        final response = await request.login("http://localhost:8000/auth/login/", {
                                            'username': username,
                                            'password': password,
                                        });

                                        if (request.loggedIn) {
                                            String message = response['message'];
                                            String uname = response['username'];
                                            if (context.mounted) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => MyHomePage()),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(
                                                        SnackBar(content: Text("$message Selamat datang, $uname.")));
                                            }
                                        } else {
                                            if (context.mounted) {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) => AlertDialog(
                                                        title: const Text('Login Gagal'),
                                                        content: Text(response['message'] ?? 'Username atau password salah.'),
                                                        actions: [
                                                            TextButton(
                                                                child: const Text('OK'),
                                                                onPressed: () {
                                                                    Navigator.pop(context);
                                                                },
                                                            ),
                                                        ],
                                                    ),
                                                );
                                            }
                                        }
                                    },
                                    child: const Text('Login'),
                                ),
                                const SizedBox(height: 12.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                                    );
                                  },
                                  child: Text(
                                    'Belum punya akun? Daftar di sini',
                                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                                  ),
                                )
                            ],
                        ),
                      ),
                    ),
                ),
            ),
        );
    }
}