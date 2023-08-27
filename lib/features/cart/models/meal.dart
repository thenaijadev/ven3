// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';

class Meal {
  final String id;

  final List<MealItemModel> meals;
  Meal(
      {String? id, // Allow providing id, otherwise generate one
      required this.meals})
      : id = id ??
            const Uuid().v4(); // If id is not provided, generate a new one

  @override
  String toString() => 'Meal(id: $id, meals: $meals)';
}
