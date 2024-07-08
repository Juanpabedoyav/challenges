import 'package:challenge1/features/authentication/presentation/provider/google_sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: const Size(
                  90,
                  50,
                ),
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInController>(context, listen: false);
                provider.googleLogin();
              },
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
              ),
              label: const Text('Regístrate con Google'),
            ),
            const SizedBox(height: 16),
            Text(
              'ó',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              child: const Text('identificarse'),
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
