import 'package:challenge1/features/shares/domain/usecases/get_shares.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
