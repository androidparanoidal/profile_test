part of 'category_overview_bloc.dart';

@freezed
class CategoryOverviewState with _$CategoryOverviewState {
  const CategoryOverviewState._();
  const factory CategoryOverviewState({
    required LoadingStatus status,
    required List<Category> categories,
  }) = _CategoryOverviewState;

  factory CategoryOverviewState.initial() => const CategoryOverviewState(
        status: LoadingStatus.initial(),
        categories: [],
      );
}
