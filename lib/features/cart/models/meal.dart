import 'package:uuid/uuid.dart';

import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';

class Meal {
  final String id;
  final int price;
  final List<MealItemModel> meals;
  Meal({String? id, int? price, required this.meals})
      : id = id ?? const Uuid().v4(),
        price = price ?? 0;

  @override
  String toString() => 'Meal(id: $id, meals: $meals)';
}
