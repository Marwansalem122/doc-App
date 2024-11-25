
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/resourses/assets_manager.dart';
import '../../../../common/resourses/strings_manager.dart';
import '../../../../common/resourses/width_size_manager.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';


class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetsManager.logo),
        horizontalSpace( WidthSizeManager.w10),
        Text(StringsManager.onBoardingTitle,style: TextStyleManager.font24BlackBoldWeight)

      ],
    );
  }
}
