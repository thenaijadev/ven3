part of 'cart_bloc.dart';

@immutable
sealed class CartState extends Equatable {}

final class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartStateItemAdded extends CartState {
  final List<Meal> meals;

  CartStateItemAdded({required this.meals});

  @override
  List<Object?> get props => [meals];
}

class CartItemIsAdding extends CartState {
  @override
  List<Object?> get props => [];
}
