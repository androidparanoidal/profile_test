// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:test_profile/application/category/category_overview_bloc.dart'
    as _i295;
import 'package:test_profile/application/product/product_bloc.dart' as _i177;
import 'package:test_profile/application/profile/profile_bloc.dart' as _i642;
import 'package:test_profile/infrastructure/repositories/catalog/catalog_repository.dart'
    as _i342;
import 'package:test_profile/infrastructure/repositories/profile/profile_repository.dart'
    as _i971;
import 'package:test_profile/shared/injectable_module.dart' as _i147;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i971.ProfileRepository>(() => _i971.ProfileRepository());
    gh.factory<_i342.CatalogRepository>(() => _i342.CatalogRepository());
    gh.lazySingleton<_i183.ImagePicker>(() => injectableModule.imagePicker);
    gh.factory<_i642.ProfileBloc>(() => _i642.ProfileBloc(
          gh<_i971.ProfileRepository>(),
          gh<_i183.ImagePicker>(),
        ));
    gh.factory<_i295.CategoryOverviewBloc>(
        () => _i295.CategoryOverviewBloc(gh<_i342.CatalogRepository>()));
    gh.factory<_i177.ProductBloc>(
        () => _i177.ProductBloc(gh<_i342.CatalogRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i147.InjectableModule {}
