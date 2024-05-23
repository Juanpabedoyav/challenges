import 'package:challenge1/features/shares/domain/models/shares.dart';
import 'package:flutter/material.dart';

class SharesList extends StatelessWidget {
  final SharesData sharesData;

  const SharesList({super.key, required this.sharesData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sharesData.pairs.length,
      itemBuilder: (context, index) {
        final pair = sharesData.pairs[index];
        return ListTile(
          leading: const Icon(Icons.share),
          title: Text(pair.name),
          subtitle: Text(pair.value.toString()),
          onTap: () {},
        );
      },
    );
  }
}
