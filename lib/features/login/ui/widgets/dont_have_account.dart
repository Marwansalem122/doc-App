
import 'package:doc_app/core/helper/navigation_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/resourses/strings_manager.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: StringsManager.dontHaveAccount,
              style:TextStyleManager.font11BlackRegular,
            ),
            TextSpan(
              text: StringsManager.signUp,
              style:  TextStyleManager.font11BlueRegular,
              recognizer: TapGestureRecognizer()..onTap = () {
                context.pushNamed(Routes.signUpScreen);
              },
            ),
          ]
        ));
  }
}
