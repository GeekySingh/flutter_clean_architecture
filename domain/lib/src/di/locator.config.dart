// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain.dart' as _i3;
import '../usecase/article_use_case_impl.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetAllArticleUseCase>(
      () => _i4.GetAllArticleUseCaseImpl(get<_i3.ArticleRepository>()));
  gh.factory<_i3.GetArticleByIdUseCase>(
      () => _i4.GetArticleByIdUseCaseImpl(get<_i3.ArticleRepository>()));
  return get;
}
