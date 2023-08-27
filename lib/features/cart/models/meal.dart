import 'package:uuid/uuid.dart';

import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';

class Meal {
  final String id;

  final List<MealItemModel> meals;
  Meal({String? id, required this.meals}) : id = id ?? const Uuid().v4();

  @override
  String toString() => 'Meal(id: $id, meals: $meals)';
}
