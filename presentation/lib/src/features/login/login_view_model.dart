
import 'package:core/core/core_view_model.dart';
import 'package:injectable/injectable.dart';

import '../../common/router.gr.dart';

@Injectable()
class LoginViewModel extends CoreViewModel {

  void onLoginButtonPressed() {
    navigationService.push(Routes.articleListScreen);
  }
}