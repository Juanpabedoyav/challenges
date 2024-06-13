import 'package:challenge1/features/authentication/presentation/pages/login_screen.dart';
import 'package:challenge1/features/shares/presentation/pages/home_page.dart';
import 'package:challenge1/features/shares/presentation/provider/shares_controller.dart';
import 'package:challenge1/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<SharesController>(
            create: (context) => getIt<SharesController>(),
          ),
        ],
        child: const LoginScreen(),
      ),
    );
  }
}
