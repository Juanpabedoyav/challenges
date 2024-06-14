import 'package:challenge1/features/authentication/presentation/pages/login_screen.dart';
import 'package:challenge1/features/shares/domain/repositories/share_repository.dart';
import 'package:challenge1/features/shares/domain/usecases/get_shares_use_case.dart';
import 'package:challenge1/features/shares/presentation/pages/home_page.dart';
import 'package:challenge1/features/shares/presentation/provider/shares_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
            create: (_) => SharesController(
                getSharesUseCase:
                    GetSharesUseCase(GetIt.I<SharesRepository>())),
          ),
        ],
        child: const LoginScreen(),
      ),
    );
  }
}
