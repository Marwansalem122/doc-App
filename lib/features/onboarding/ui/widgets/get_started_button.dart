import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/resourses/strings_manager.dart';
import '../../../../common/resourses/width_size_manager.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/onboarding_controller.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: WidthSizeManager.w50),
      child: TextButton(
          onPressed: () {
            OnBoardingController.goToLoginScreen(context);
          },

          style: TextButton.styleFrom(
            backgroundColor: AppColors.mainBlue,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize:  Size(double.infinity, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )
          ),
          child: Text(StringsManager.getStarted,
              style: TextStyleManager.font16WhiteSemiBoldWeight)),
    );
  }
}
