import 'package:flutter/material.dart';

import '/src/constants/constant.dart';

class BarChart extends StatelessWidget {
  const BarChart(this.expenses, {Key? key}) : super(key: key);

  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;

    expenses.forEach((price) {
      if (price > mostExpensive) mostExpensive = price;
    });

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "Weekly Spending",
            style: kTextStyleBold.copyWith(letterSpacing: 1.0),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Text(
                "Nov 10 - Nov 16",
                style: kTextStyleSemiBold.copyWith(
                  fontSize: 14.0,
                  letterSpacing: 1.0,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: "Su",
                amountSpent: expenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Mo",
                amountSpent: expenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Tu",
                amountSpent: expenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "We",
                amountSpent: expenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Th",
                amountSpent: expenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Fr",
                amountSpent: expenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Sa",
                amountSpent: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  Bar({
    Key? key,
    required this.label,
    required this.amountSpent,
    required this.mostExpensive,
  }) : super(key: key);

  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 140.0;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;

    return Column(
      children: [
        Text(
          "\$${amountSpent.toStringAsFixed(2)}",
          style: kTextStyleSemiBold.copyWith(fontSize: 12.0),
        ),
        const SizedBox(height: 5.0),
        Container(
          height: barHeight,
          width: 14.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        const SizedBox(height: 7.0),
        Text(
          label,
          style: kTextStyleSemiBold.copyWith(fontSize: 12.0),
        ),
      ],
    );
  }
}
