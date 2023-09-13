import 'package:the_food_hub_nsk_nig/core/network/typedef.dart';
import 'package:the_food_hub_nsk_nig/features/products/data/providers/products_provider.dart';

class ProductsRepository {
  final ProductsProvider provider;
  ProductsRepository(this.provider);

  factory ProductsRepository.instance() =>
      ProductsRepository(ProductsProvider());

  EitherProductList getAllProducts() async {
    final response = await provider.getAllProducts();

    return response;
  }

  EitherProduct getProductById({required String id}) async {
    final response = await provider.getProductById(id: id);

    return response;
  }
}
