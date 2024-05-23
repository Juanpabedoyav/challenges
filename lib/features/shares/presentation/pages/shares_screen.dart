import 'package:challenge1/features/shares/presentation/provider/shares_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SharesScreen extends StatefulWidget {
  const SharesScreen({super.key});

  @override
  State<SharesScreen> createState() => _SharesScreenState();
}

class _SharesScreenState extends State<SharesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        context.watch<SharesProvider>().getSharesUseCase().toString(),
      ),
    );
  }
}
