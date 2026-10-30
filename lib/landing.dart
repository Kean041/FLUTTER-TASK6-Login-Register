import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Masaway Login and Register')),
      body: Center(
        child: Text('Welcome, $username', style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
