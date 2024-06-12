import 'package:challenge1/design_system/tokens/colors.dart';
import 'package:challenge1/features/shares/presentation/widgets/icon_header_container.dart';
import 'package:flutter/material.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
            color: BaseColors.bgWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Store Name',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        IconHeaderContainer(
          iconButton: IconButton(
              onPressed: () => print('press button more'),
              icon: const Icon(Icons.more_vert)),
        )
      ],
    );
  }
}
