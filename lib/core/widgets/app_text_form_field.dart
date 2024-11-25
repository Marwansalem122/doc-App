
import 'package:flutter/material.dart';

import '../../common/resourses/height_size_manager.dart';
import '../../common/resourses/width_size_manager.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final bool? isObsecureText;
  final Widget? suffixIcon;
  final String hintText;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.isObsecureText,
    this.suffixIcon,
    this.hintStyle,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                  horizontal: WidthSizeManager.w20,
                  vertical: HeightSizeManager.h18),
          focusedBorder:
              focusedBorder ?? outlineInputBorder(AppColors.mainBlue),
          enabledBorder:
              enabledBorder ?? outlineInputBorder(AppColors.lighterGray),
          errorBorder: outlineInputBorder(Colors.red),
          focusedErrorBorder: outlineInputBorder(Colors.red),
          suffixIcon: suffixIcon ?? null,
          hintText: hintText,
          filled: true,
          fillColor: backgroundColor ?? AppColors.moreLightGray,
          hintStyle: hintStyle ?? TextStyleManager.font14LightGrayMedium),
      obscureText: isObsecureText ?? false,
      style: inputTextStyle ?? TextStyleManager.font14DarkBlueMedium,
    );
  }

  InputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.lighterGray, width: 1.3),
        borderRadius: BorderRadius.circular(16));
  }
}
