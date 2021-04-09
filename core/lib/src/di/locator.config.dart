// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../service/dialog_service.dart' as _i3;
import '../../service/navigation_service.dart' as _i4;
import '../../service/toast_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DialogService>(() => _i3.DialogService());
  gh.lazySingleton<_i4.NavigationService>(() => _i4.NavigationService());
  gh.lazySingleton<_i5.ToastService>(() => _i5.ToastService());
  return get;
}
