import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jual_bola_dll/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun Baru'),
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
                    'Register',
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
                      hintText: 'Masukkan username',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Masukkan password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordConfirmationController,
                    decoration: const InputDecoration(
                      labelText: 'Konfirmasi Password',
                      hintText: 'Masukkan kembali password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_clock),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50), // Tombol full width
                    ),
                    onPressed: () async {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        String passwordConfirmation = _passwordConfirmationController.text;

                        if (username.isEmpty || password.isEmpty || passwordConfirmation.isEmpty) {
                           ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Semua kolom harus diisi!")),
                            );
                            return;
                        }

                        if (password != passwordConfirmation) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Password tidak cocok!")),
                            );
                            return;
                        }

                        // Kirim data ke Django
                        final response = await request.postJson(
                            "http://localhost:8000/auth/register/",
                            jsonEncode(<String, String>{
                                'username': username,
                                'password1': password,
                                'password2': passwordConfirmation,
                            }),
                        );

                        if (context.mounted) {
                            if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Akun berhasil dibuat! Silakan login."),
                                    ),
                                );
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                            } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(response['message'] ?? "Gagal melakukan pendaftaran."),
                                    ),
                                );
                            }
                        }
                    },
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 12.0),
                  TextButton(
                    onPressed: () {
                       Navigator.pop(context);
                    },
                    child: const Text('Sudah punya akun? Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}