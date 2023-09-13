import 'package:the_food_hub_nsk_nig/core/network/typedef.dart';

abstract class ProductInterface {
  EitherProductList getAllProducts();
  EitherProduct getProductById({required String id});
}
