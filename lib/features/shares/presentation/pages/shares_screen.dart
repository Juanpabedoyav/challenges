import 'package:challenge1/features/shares/presentation/provider/shares_controller.dart';
import 'package:challenge1/features/shares/presentation/widgets/share_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// SharesScreen
class SharesScreen extends StatefulWidget {
  const SharesScreen({super.key});

  @override
  State<SharesScreen> createState() => _SharesScreenState();
}

class _SharesScreenState extends State<SharesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SharesController>().fetchShares();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ShareList();
  }
}
