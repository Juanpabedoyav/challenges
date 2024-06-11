import 'package:challenge1/design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

class IconHeaderContainer extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? configMargin;
  const IconHeaderContainer(
      {super.key, required this.iconButton, this.configMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: configMargin,
      decoration: BoxDecoration(
        border: Border.all(color: BaseColors.bgDarkGray),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: iconButton,
    );
  }
}