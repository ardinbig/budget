import 'package:flutter/material.dart';

import '/src/data/data.dart';
import '/src/helpers/color_helper.dart';
import '/src/models/category_model.dart';
import '/src/widgets/bar_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildCategory(Category category, double totalAmountSpent) {
    return Container(
      height: 90.0,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)}"
                " / \$${category.maxAmount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          LayoutBuilder(builder: (context, constraints) {
            final double maxBarWidth = constraints.maxWidth;
            final double percent =
                (category.maxAmount - totalAmountSpent) / category.maxAmount;
            double barWidth = percent * maxBarWidth;
            if (barWidth < 0) barWidth = 0;

            return Stack(
              children: [
                Container(
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                Container(
                  height: 16.0,
                  width: barWidth,
                  decoration: BoxDecoration(
                    color: getColor(context, percent),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 80.0,
            forceElevated: true,
            // pinned: true,
            floating: true,
            leading: IconButton(
              onPressed: () {},
              iconSize: 30.0,
              icon: const Icon(Icons.settings),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("Budget"),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                iconSize: 30.0,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) {
                if (i == 0) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 6.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: BarChart(weeklySpending),
                  );
                } else {
                  final category = categories[i - 1];
                  double totalAmountSpent = 0.0;

                  category.expenses.forEach((expense) {
                    totalAmountSpent += expense.cost;
                  });

                  return _buildCategory(category, totalAmountSpent);
                }
              },
              childCount: 1 + categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
