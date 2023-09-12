import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:the_food_hub_nsk_nig/core/network/api_endpoint.dart';
import 'package:the_food_hub_nsk_nig/core/network/dio_client.dart';
import 'package:the_food_hub_nsk_nig/core/network/dio_exception.dart';
import 'package:the_food_hub_nsk_nig/core/network/typedef.dart';
import 'package:the_food_hub_nsk_nig/features/products/data/interfaces/products_interface.dart';
import 'package:the_food_hub_nsk_nig/features/products/models/product.dart';

class ProductsProvider extends ProductInterface {
  @override
  EitherProductList getAllProducts() async {
    try {
      final response = await DioClient.instance.get(
        RoutesAndPaths.getAllProducts,
      );
      List<Product> products = [];
      for (var element in response) {
        final Product product = Product.fromJson(element);
        products.add(product);
        print(product.name);
      }

      return right(products);
    } on DioException catch (e) {
      final errorMessage = DioExceptionClass.fromDioError(e).toString();
      print(errorMessage);
      return left(errorMessage);
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }
}
