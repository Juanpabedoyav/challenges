import 'package:challenge1/features/shares/presentation/bloc/shares/shares_bloc.dart';
import 'package:challenge1/features/shares/presentation/bloc/shares/shares_event.dart';
import 'package:challenge1/features/shares/presentation/pages/shares_screen.dart';
import 'package:challenge1/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => getIt<SharesBloc>()..add(FetchShares()),
          child: const SharesScreen(),
        ));
  }
}
