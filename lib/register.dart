import 'package:flutter/material.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _genderController = TextEditingController();
  final _civilStatusController = TextEditingController();
  final _birthdateController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _genderController.dispose();
    _civilStatusController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  Future<void> _selectBirthdate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      _birthdateController.text =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    }
  }

  void _register() {
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Password does not match')));
      return;
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Masaway Login/Register'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          child: Column(
            children: [
              ActivityTextInput(
                controller: _fullnameController,
                label: 'Fullname',
                hint: 'Fullname',
                icon: Icons.person,
                requiredField: true,
              ),
              const SizedBox(height: 12),
              ActivityTextInput(
                controller: _usernameController,
                label: 'Username',
                hint: 'Username',
                icon: Icons.account_circle,
                requiredField: true,
              ),
              const SizedBox(height: 12),
              ActivityTextInput(
                controller: _passwordController,
                label: 'Password',
                hint: 'Password',
                icon: Icons.lock,
                obscureText: true,
                requiredField: true,
              ),
              const SizedBox(height: 12),
              ActivityTextInput(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                hint: 'Confirm Password',
                icon: Icons.lock_outline,
                obscureText: true,
                requiredField: true,
              ),
              const SizedBox(height: 12),
              ActivityTextInput(
                controller: _genderController,
                label: 'Gender',
                hint: 'Gender',
                icon: Icons.wc,
                requiredField: true,
              ),
              const SizedBox(height: 12),
              ActivityTextInput(
                controller: _civilStatusController,
                label: 'Civil Status',
                hint: 'Civil Status',
                icon: Icons.people,
                requiredField: true,
              ),
              const SizedBox(height: 12),
              ActivityTextInput(
                controller: _birthdateController,
                label: 'Birthdate',
                hint: 'Birthdate',
                icon: Icons.calendar_month,
                requiredField: true,
                readOnly: true,
                onTap: _selectBirthdate,
              ),
              const SizedBox(height: 20),
              ActivityActionButton(label: 'Register', onPressed: _register),
              const SizedBox(height: 12),
              ActivityActionButton(
                label: 'Back to Login',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
