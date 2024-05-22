import 'package:challenge1/features/shares/presentation/provider/share_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SharesList extends StatelessWidget {
  SharesList._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: ShareListController()..getShares(),
      builder: (_, __) => SharesList._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
