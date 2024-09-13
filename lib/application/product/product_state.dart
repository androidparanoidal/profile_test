part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    required LoadingStatus status,
    required List<Product> products,
  }) = _ProductState;

  factory ProductState.initial() => const ProductState(
        status: LoadingStatus.initial(),
        products: [],
      );
}
