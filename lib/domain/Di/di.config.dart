// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth/auth_repo_impl.dart' as _i9;
import '../../data/repos/main/data%20sources/main_online_ds_impl.dart' as _i7;
import '../../data/repos/main/main_repo_impl.dart' as _i13;
import '../../data/utils/sharedpref_utils.dart' as _i3;
import '../../ui/screens/auth/login/login_view_model.dart' as _i14;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i15;
import '../../ui/screens/main/main_screen_view_model.dart' as _i4;
import '../../ui/screens/main/tabs/homeTab/home_view_model.dart' as _i18;
import '../repos/auth/auth_repo.dart' as _i8;
import '../repos/main/data%20sources/main_online_ds.dart' as _i6;
import '../repos/main/main_repo.dart' as _i12;
import '../use%20cases/get_all_categories_usecase.dart' as _i16;
import '../use%20cases/get_all_products_usecase.dart' as _i17;
import '../use%20cases/login_use_case.dart' as _i10;
import '../use%20cases/signup_use_case.dart' as _i11;
import 'app_module.dart' as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.SharedPrefUtils>(() => _i3.SharedPrefUtils());
    gh.factory<_i4.MainScreenViewModel>(() => _i4.MainScreenViewModel());
    gh.factory<_i5.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i6.MainOnlineDS>(() => _i7.MainOnlineDsImpl());
    gh.factory<_i8.AuthRepo>(() => _i9.AuthRepoImpl(gh<_i3.SharedPrefUtils>()));
    gh.factory<_i10.LoginUseCase>(() => _i10.LoginUseCase(gh<_i8.AuthRepo>()));
    gh.factory<_i11.SignUpUseCase>(
        () => _i11.SignUpUseCase(gh<_i8.AuthRepo>()));
    gh.factory<_i12.MainRepo>(() => _i13.MainRepoImpl(gh<_i6.MainOnlineDS>()));
    gh.factory<_i14.LoginViewModel>(
        () => _i14.LoginViewModel(gh<_i10.LoginUseCase>()));
    gh.factory<_i15.SignUpViewModel>(
        () => _i15.SignUpViewModel(gh<_i11.SignUpUseCase>()));
    gh.factory<_i16.GetAllCategoriesUseCase>(
        () => _i16.GetAllCategoriesUseCase(gh<_i12.MainRepo>()));
    gh.factory<_i17.GetAllProductsUseCase>(
        () => _i17.GetAllProductsUseCase(gh<_i12.MainRepo>()));
    gh.factory<_i18.HomeViewModel>(() => _i18.HomeViewModel(
          gh<_i16.GetAllCategoriesUseCase>(),
          gh<_i17.GetAllProductsUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i19.AppModule {}
