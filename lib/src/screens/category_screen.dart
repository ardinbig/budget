import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '/src/helpers/color_helper.dart';
import '/src/models/category_model.dart';
import '/src/widgets/radial_painter.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen(this.category, {Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Widget _buildExpenses() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((expense) {
      expenseList.add(
        Container(
          height: 80.0,
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [kBoxShadow],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  expense.name,
                  style: kTextStyleBold,
                ),
                Text(
                  "\$${expense.cost.toStringAsFixed(2)}",
                  style: kTextStyleSemiBold.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: expenseList);
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;

    widget.category.expenses.forEach((expense) {
      totalAmountSpent += expense.cost;
    });

    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 200.0,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [kBoxShadow],
              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  backgroundColor: Colors.grey[200],
                  lineColor: getColor(context, percent),
                  percent: percent,
                  width: 14.0,
                ),
                child: Center(
                  child: Text(
                    "\$${amountLeft.toStringAsFixed(2)}"
                    "/ \$${widget.category.maxAmount}",
                    style: kTextStyleSemiBold,
                  ),
                ),
              ),
            ),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }
}
