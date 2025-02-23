import 'package:flutter/material.dart';
import '../components/text_input_field.dart';
import '../components/custom_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TextInputField(label: 'First Name'),
                const TextInputField(label: 'Middle Name'),
                const TextInputField(label: 'Last Name'),
                const TextInputField(label: 'Date of Birth'),
                const TextInputField(label: 'Gender'),
                const TextInputField(label: 'Mobile Number'),
                const TextInputField(label: 'Email'),
                const TextInputField(label: 'Address Line 1'),
                const TextInputField(label: 'Address Line 2'),
                const TextInputField(label: 'Landmark'),
                const TextInputField(label: 'City'),
                const TextInputField(label: 'State'),
                const TextInputField(label: 'Username'),
                const TextInputField(label: 'Password', obscureText: true),
                const SizedBox(height: 20),
                CustomButton(text: 'Register', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}