import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:challenge1/features/shares/presentation/pages/shares_screen.dart';
import 'package:challenge1/features/shares/presentation/provider/shares_provider.dart';
import 'package:challenge1/injection_container.dart'; // Asegúrate de que este archivo esté configurado correctamente
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SharesProvider(getIt<GetShares>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SharesScreen(),
      ),
    );
  }
}
