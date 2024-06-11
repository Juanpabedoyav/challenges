import 'package:challenge1/features/shares/presentation/provider/shares_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// SharesScreen
class SharesScreen extends StatelessWidget {
  const SharesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SharesController>(
        builder: (context, sharesController, child) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: sharesController.shares!.pairs!.length,
        itemBuilder: (context, index) {
          final share = sharesController.shares!.pairs;
          print(share);
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            margin: const EdgeInsets.all(8),
          );
        },
      );
    });
  }
}
