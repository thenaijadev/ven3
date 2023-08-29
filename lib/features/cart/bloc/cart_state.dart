// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  CartStateItemAdded copyWith({
    List<Meal>? meals,
  }) {
    return CartStateItemAdded(
      meals: meals ?? this.meals,
    );
  }

  @override
  List<Object?> get props => [meals];
}

class CartItemIsAdding extends CartState {
  @override
  List<Object?> get props => [];
}
