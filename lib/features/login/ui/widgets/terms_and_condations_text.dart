import 'package:flutter/material.dart';

import '../../../../common/resourses/strings_manager.dart';
import '../../../../core/theming/styles.dart';

class TermsAndCondationsText extends StatelessWidget {
  const TermsAndCondationsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: StringsManager.byLogging,
              style: TextStyleManager.font11GrayRegular,
            ),
            TextSpan(
              text: StringsManager.termsAndConditions,
              style: TextStyleManager.font11BlackRegular,
            ),
            TextSpan(
              text: StringsManager.and,
              style: TextStyleManager.font11GrayRegular.copyWith(height: 1.5),
            ),
            TextSpan(
              text: StringsManager.privacyPolicy,
              style: TextStyleManager.font11BlackRegular,
            ),
          ]
        ));
  }
}
