// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealItemModel {
  MealItemModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.quantity,
      required this.image});
  final String name;
  final int price;
  final int quantity;
  final String id;
  final String image;

  @override
  String toString() {
    return 'MealItemModel(name: $name, price: $price, quantity: $quantity, id: $id, image: $image)';
  }

  MealItemModel copyWith({
    String? name,
    int? price,
    int? quantity,
    String? id,
    String? image,
  }) {
    return MealItemModel(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }
}
