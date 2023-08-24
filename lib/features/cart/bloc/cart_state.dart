part of 'cart_bloc.dart';

@immutable
sealed class CartState extends Equatable {}

final class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartStateItemAdded extends CartState {
  final List<FoodTypeItem> items;

  CartStateItemAdded({required this.items});

  @override
  List<Object?> get props => [items];
}

class CartItemIsAdding extends CartState {
  @override
  List<Object?> get props => [];
}
