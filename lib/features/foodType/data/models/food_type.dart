import 'package:uuid/uuid.dart';

class FoodType {
  final String id;
  final String type;
  final List items;

  FoodType({
    String? id, // Allow providing id, otherwise generate one
    required this.type,
    required this.items,
  }) : id = id ??
            const Uuid().v4(); // If id is not provided, generate a new one

  @override
  String toString() {
    return 'FoodCategory(id: $id, name: $type, image: $items)';
  }
}
