part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductEventFetchProducts extends ProductEvent {}

class ProductEventFetchProduct extends ProductEvent {
  final String id;
  const ProductEventFetchProduct({required this.id});
}
