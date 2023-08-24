import 'package:uuid/uuid.dart';

class FoodCategory {
  FoodCategory({
    required this.id,
    required this.name,
    required this.image,
  });
  String id = const Uuid().v4();
  final String name;
  final String image;
}
