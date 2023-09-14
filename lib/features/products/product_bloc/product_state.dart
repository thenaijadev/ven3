part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductStateInitial extends ProductState {}

class ProductStateIsLoading extends ProductState {}

class ProductStateProductsRetreived extends ProductState {
  final List<Product> products;

  const ProductStateProductsRetreived({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductStateProductRetreived extends ProductState {
  final Product product;
  final List<Product> products;
  const ProductStateProductRetreived(
      {required this.products, required this.product});
  @override
  List<Object> get props => [product, products];
}

class ProductStateError extends ProductState {
  final String error;
  const ProductStateError({required this.error});
  @override
  List<Object> get props => [error];
}
