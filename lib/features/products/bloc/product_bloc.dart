import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_food_hub_nsk_nig/features/products/data/repositories/products_repository.dart';
import 'package:the_food_hub_nsk_nig/features/products/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(ProductsRepository repo) : super(ProductStateInitial()) {
    on<ProductEventFetchProducts>((event, emit) async {
      emit(ProductStateIsLoading());
      final response = await repo.getAllProducts();
      response.fold((l) => emit(ProductStateError(error: l)), (r) {
        emit(ProductStateProductsRetreived(products: r));
      });
    });

    on<ProductEventFetchProduct>((event, emit) async {
      emit(ProductStateIsLoading());
      final response = await repo.getProductById(id: event.id);
      response.fold((l) => emit(ProductStateError(error: l)), (r) {
        emit(ProductStateProductRetreived(product: r));
      });
    });
  }
}
