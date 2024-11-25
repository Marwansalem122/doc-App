
import 'package:doc_app/core/helper/navigation_extension.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/routing/routes.dart';

class OnBoardingController {
  static void goToLoginScreen(BuildContext context) {
    context.pushNamed(Routes.loginScreen);
  }
}