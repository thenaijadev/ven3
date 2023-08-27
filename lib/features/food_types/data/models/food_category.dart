import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food.dart';
import 'package:uuid/uuid.dart';

class FoodCategory implements Food {
  @override
  final String id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String? type;
  @override
  final int? price;

  FoodCategory(
      {String? id, // Allow providing id, otherwise generate one
      required this.name,
      this.price,
      required this.image,
      this.type})
      : id = id ??
            const Uuid().v4(); // If id is not provided, generate a new one

  @override
  String toString() {
    return 'FoodCategory(id: $id, name: $name, image: $image)';
  }
}
