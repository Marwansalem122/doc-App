
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/resourses/assets_manager.dart';
import '../../../../common/resourses/height_size_manager.dart';
import '../../../../common/resourses/strings_manager.dart';
import '../../../../common/resourses/width_size_manager.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';



class DocImageAndImage extends StatelessWidget {
  const DocImageAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AssetsManager.docLowOpacity),
        Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.white, AppColors.whiteWithOpacity],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.14, 0.4],
              ),
            ),
            child: Image.asset(AssetsManager.onBoardingDoctorImage)),
        Positioned(
          bottom: HeightSizeManager.h30,
          left: WidthSizeManager.w0,
          right: WidthSizeManager.w0,
          child: Text(StringsManager.onBoardingTitle2,
              textAlign: TextAlign.center,
              style: TextStyleManager.font32BlueBold.copyWith(
                height: 1.4
              )),
        )
      ],
    );
  }
}
