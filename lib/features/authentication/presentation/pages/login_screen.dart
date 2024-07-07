import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login with Google'),
            ),
            const SizedBox(height: 16),
            Text(
              'or',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              child: const Text('Sign up'),
              onTap: () {
                Navigator.pushNamed(context, '/account');
              },
            )
          ],
        ),
      ),
    );
  }
}
