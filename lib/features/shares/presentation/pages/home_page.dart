import 'package:challenge1/design_system/tokens/colors.dart';
import 'package:challenge1/design_system/tokens/radius.dart';
import 'package:challenge1/features/shares/presentation/pages/shares_screen.dart';
import 'package:challenge1/features/shares/presentation/widgets/custom_money_display.dart';
import 'package:challenge1/features/shares/presentation/widgets/home_app_bar_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'My Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      appBar: AppBar(
        toolbarHeight: 97,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: BaseRadius.small,
            bottomRight: BaseRadius.small,
          ),
        ),
        backgroundColor: BaseColors.brandPrimaryMat,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(8, 30, 8, 20),
          child: HomeAppBarTitle(),
        ),
      ),
      body: const Column(
        children: [TopHomePageBody(), Expanded(child: BottomHomePageBody())],
      ),
    );
  }
}

class TopHomePageBody extends StatelessWidget {
  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0, -12, 0),
      decoration: const BoxDecoration(
          color: BaseColors.scale02,
          borderRadius: BorderRadius.only(
            bottomLeft: BaseRadius.small,
            bottomRight: BaseRadius.small,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(21),
            child: Text(
              'Your Budget',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          CustomMoneyDisplay(
            amount: 2868000.12,
            amountStyle: Theme.of(context).textTheme.headlineLarge!,
            amountStyleSmall: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: BaseColors.bGBlack,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomHomePageBody extends StatelessWidget {
  const BottomHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SharesScreen();
  }
}
