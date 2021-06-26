import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            Container(
              height: 200.0,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: const Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
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
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
