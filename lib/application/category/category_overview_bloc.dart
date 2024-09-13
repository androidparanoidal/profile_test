import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_profile/infrastructure/repositories/catalog/catalog_repository.dart';
import '../../domain/category/category.dart';
import '../../domain/loading_status/loading_status.dart';

part 'category_overview_event.dart';
part 'category_overview_state.dart';
part 'category_overview_bloc.freezed.dart';

@injectable
class CategoryOverviewBloc extends Bloc<CategoryOverviewEvent, CategoryOverviewState> {
  final CatalogRepository _catalogRepository;
  CategoryOverviewBloc(this._catalogRepository) : super(CategoryOverviewState.initial()) {
    on<CategoryOverviewEvent>(
      (event, emit) => event.map(
        started: (event) => _started(event, emit),
      ),
    );
  }

  _started(event, Emitter<CategoryOverviewState> emit) async {
    try {
      emit(state.copyWith(status: const LoadingStatus.loading()));
      final categories = await _catalogRepository.getCategories();
      emit(state.copyWith(categories: categories, status: const LoadingStatus.success()));
    } catch (e) {
      emit(state.copyWith(status: LoadingStatus.failure(e.toString())));
    }
  }
}
