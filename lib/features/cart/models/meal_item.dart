// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealItemModel {
  MealItemModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.amount,
      required this.image});
  final String name;
  final int price;
  final int amount;
  final String id;
  final String image;

  @override
  String toString() {
    return 'MealItemModel(name: $name, price: $price, amount: $amount, id: $id, image: $image)';
  }
}
