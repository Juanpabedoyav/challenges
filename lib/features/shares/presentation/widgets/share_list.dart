import 'package:challenge1/core/utils/base_controller_states.dart';
import 'package:challenge1/features/shares/presentation/provider/shares_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShareList extends StatelessWidget {
  const ShareList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SharesController>(
      builder: (context, sharesController, child) {
        if (sharesController.status == BaseControllerStates.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        int pairLength = sharesController.shares.pairs!.length;
        final pair = sharesController.shares.pairs!.entries.toList();
        return ListView.builder(
          itemCount: pairLength,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(pair[index].key),
              subtitle: Text(pair[index].value.toString()),
              trailing: Text('${(1 / pair[index].value).ceilToDouble()}'),
              onTap: () => print('tap'),
            );
          },
        );
      },
    );
  }
}
