import 'package:flutter/material.dart';

class SharesScreenDetail extends StatelessWidget {
  final String symbol;

  const SharesScreenDetail({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(symbol)));
  }
}
