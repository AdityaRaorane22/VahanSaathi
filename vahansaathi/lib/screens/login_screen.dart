import 'package:flutter/material.dart';
import 'package:vahansaathi/screens/singup_screen.dart';
import '../components/text_input_field.dart';
import '../components/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextInputField(label: 'Username'),
              const TextInputField(label: 'Password', obscureText: true),
              const SizedBox(height: 20),
              CustomButton(text: 'Login', onPressed: () {}),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const SignupScreen()),
                  );
                },
                child: const Text("Haven't registered yet? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}