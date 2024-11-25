
import 'package:flutter/material.dart';
import '../../../common/resourses/height_size_manager.dart';
import '../../../common/resourses/strings_manager.dart';
import '../../../core/theming/styles.dart';
import"../../../features/onboarding/ui/widgets/doc_image_and_image.dart";
import"../../../features/onboarding/ui/widgets/doc_logo_and_name.dart";
import"../../../features/onboarding/ui/widgets/get_started_button.dart";

import '../../../common/resourses/width_size_manager.dart';
import '../../../core/helper/spacing.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: HeightSizeManager.h20, bottom: HeightSizeManager.h20),
          child: Column(children: [
            const DocLogoAndName(),
            SizedBox(height:HeightSizeManager.h20),
            const DocImageAndImage(),
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: WidthSizeManager.w30),
                  child: Text(StringsManager.onBoardingSubTitle,
                      textAlign: TextAlign.center,
                      style: TextStyleManager.font13GrayRegular),
                ),
                verticalSpace( HeightSizeManager.h15),
                const GetStartedButton()
              ],
            )
          ]),
        ),
      )),
    );
  }
}
