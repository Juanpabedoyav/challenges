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
            icon: Icon(Icons.cloud),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: BaseRadius.small,
            bottomRight: BaseRadius.small,
          ),
        ),
        backgroundColor: BaseColors.scale01,
        title: const HomeAppBarTitle(),
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
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: BaseColors.scale02,
          borderRadius: BorderRadius.only(
            bottomLeft: BaseRadius.small,
            bottomRight: BaseRadius.small,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'Investment Account',
            style: Theme.of(context).textTheme.labelSmall,
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
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => {}, child: const Text('+ Add Money')),
              ElevatedButton(
                  onPressed: () => {}, child: const Text('Withdraw')),
              ElevatedButton(onPressed: () => {}, child: Icon(Icons.more_horiz))
            ],
          )
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
