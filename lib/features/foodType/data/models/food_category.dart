import 'package:uuid/uuid.dart';

class FoodCategory {
  final String id;
  final String name;
  final String image;

  FoodCategory({
    String? id, // Allow providing id, otherwise generate one
    required this.name,
    required this.image,
  }) : id = id ??
            const Uuid().v4(); // If id is not provided, generate a new one

  @override
  String toString() {
    return 'FoodCategory(id: $id, name: $name, image: $image)';
  }
}
