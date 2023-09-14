// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
sealed class CartState extends Equatable {}

final class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartStateItemAdded extends CartState {
  final List<Product> products;

  CartStateItemAdded({required this.products});

  @override
  List<Object?> get props => [products];
}

class CartStateItemRemoved extends CartState {
  final List<Product> products;

  CartStateItemRemoved({required this.products});

  @override
  List<Object?> get props => [products];
}

class CartItemIsAdding extends CartState {
  @override
  List<Object?> get props => [];
}
