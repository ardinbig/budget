import 'expense_model.dart';

class Category {
  const Category({
    required this.name,
    required this.maxAmount,
    required this.expenses,
  });

  final String name;
  final double maxAmount;
  final List<Expense> expenses;
}
