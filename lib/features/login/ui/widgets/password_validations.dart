import 'package:flutter/material.dart';

import '../../../../common/resourses/height_size_manager.dart';
import '../../../../common/resourses/width_size_manager.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumber,
      required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildValidationRow("At least 1 lowercase letter", hasLowerCase),
      verticalSpace(HeightSizeManager.h2),
      buildValidationRow("At least 1 uppercase letter", hasUpperCase),
      verticalSpace(HeightSizeManager.h2),
      buildValidationRow("At least 1 special character", hasSpecialCharacters),
      verticalSpace(HeightSizeManager.h2),
      buildValidationRow("At least 1 number", hasNumber),
      verticalSpace(HeightSizeManager.h2),
      buildValidationRow("At least 8 characters", hasMinLength),
    ]);
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: AppColors.gray,
      ),
      horizontalSpace(WidthSizeManager.w6),
      Text(text,
          style: TextStyleManager.font13DarkBlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? AppColors.gray : AppColors.darkBlue)),
    ]);
  }
}
