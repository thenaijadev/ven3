// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String? id;
  String? object;
  Brand? brand;
  Brand? category;
  String? code;
  String? description;
  String? image;
  String? name;
  String? price;
  int? quantity;
  int? amount;
  bool? isFavourite;
  String? size;

  Product(
      {this.id,
      this.object,
      this.brand,
      this.category,
      this.isFavourite = false,
      this.code,
      this.description,
      this.image,
      this.name,
      this.price,
      this.amount,
      this.quantity,
      this.size});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    category =
        json['category'] != null ? Brand.fromJson(json['category']) : null;
    code = json['code'];
    description = json['description'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['code'] = code;
    data['description'] = description;
    data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['size'] = size;
    return data;
  }

  Product copyWith({
    String? id,
    String? object,
    Brand? brand,
    Brand? category,
    String? code,
    String? description,
    String? image,
    String? name,
    String? price,
    int? quantity,
    int? amount,
    bool? isFavourite,
    String? size,
  }) {
    return Product(
      id: id ?? this.id,
      object: object ?? this.object,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      code: code ?? this.code,
      description: description ?? this.description,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      amount: amount ?? this.amount,
      isFavourite: isFavourite ?? this.isFavourite,
      size: size ?? this.size,
    );
  }
}

class Brand {
  String? id;
  String? object;
  String? name;

  Brand({this.id, this.object, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['name'] = name;
    return data;
  }
}
