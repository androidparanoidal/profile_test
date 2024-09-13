import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_profile/infrastructure/repositories/catalog/fake_products.dart';
import '../../domain/loading_status/loading_status.dart';
import '../../domain/product/product.dart';
import '../../infrastructure/repositories/catalog/catalog_repository.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CatalogRepository _catalogRepository;
  ProductBloc(this._catalogRepository) : super(ProductState.initial()) {
    on<ProductEvent>(
      (event, emit) => event.map(
        started: (event) => _started(event, emit),
      ),
    );
  }

  _started(_Started event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(status: const LoadingStatus.loading()));
      final category = event.id == 1
          ? fakeWomenProducts
          : event.id == 2
              ? fakeMenProducts
              : fakeKidsProducts;
      final products = await _catalogRepository.getProductByCategory(event.id, category);
      emit(state.copyWith(products: products, status: const LoadingStatus.success()));
    } catch (e) {
      emit(state.copyWith(status: LoadingStatus.failure(e.toString())));
    }
  }
}
