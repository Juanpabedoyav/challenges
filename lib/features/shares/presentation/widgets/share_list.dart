import 'package:flutter/material.dart';

class ShareList extends StatelessWidget {
  final Map<String, double> pairs;
  final int pairLength;

  const ShareList({super.key, required this.pairs, required this.pairLength});

  @override
  Widget build(BuildContext context) {
    final pair = pairs.entries.toList();
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
  }
}
