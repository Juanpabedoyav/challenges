import 'package:challenge1/design_system/tokens/colors.dart';
import 'package:challenge1/design_system/tokens/radius.dart';
import 'package:challenge1/features/shares/presentation/widgets/custom_money_display.dart';
import 'package:flutter/material.dart';

enum TypeSummaryCard { income, spend }

class SummaryCard extends StatelessWidget {
  final TypeSummaryCard typeSummaryCard;
  final double amount;
  final String period;
  final void Function()? action;
  const SummaryCard(
      {super.key,
      required this.typeSummaryCard,
      required this.amount,
      required this.period,
      this.action});

  @override
  Widget build(BuildContext context) {
    var incomesIcon = const Icon(
      Icons.arrow_upward,
      color: Color.fromARGB(255, 0, 143, 57),
    );
    var spendIcon = const Icon(
      Icons.arrow_downward,
      color: Color.fromARGB(255, 255, 0, 0),
    );

    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: BaseColors.scale01,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(BaseRadius.xs),
              border: Border.all(color: BaseColors.scale02),
            ),
            child: typeSummaryCard == TypeSummaryCard.income
                ? incomesIcon
                : spendIcon,
          ),
          Expanded(
            child: Text(
              typeSummaryCard == TypeSummaryCard.income
                  ? 'Incomes'
                  : 'Spending',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Container(
            //        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomMoneyDisplay(
                  amount: amount,
                  amountStyle: Theme.of(context).textTheme.displayMedium!,
                  amountStyleSmall: Theme.of(context).textTheme.displaySmall!,
                ),
              ],
            ),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: BaseColors.scale02)),
            child: IconButton(
              icon: const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onPressed: action,
            ),
          )
        ],
      ),
    );
  }
}
