import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_food_hub_nsk_nig/features/products/models/product.dart';

typedef EitherMap = Future<Either<String, Map<String, dynamic>>>;
typedef EitherProductList = Future<Either<String, List<Product>>>;
typedef EitherProduct = Future<Either<String, Product>>;

typedef EitherUser = Future<Either<String, User?>>;

typedef EitherBool = Future<Either<String, bool?>>;

typedef EitherAuthResponse = Future<Either<String, AuthResponse>>;
