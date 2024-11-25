
import 'package:doc_app/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/resourses/height_size_manager.dart';
import '../../../../common/resourses/strings_manager.dart';
import '../../../../core/helper/app_regex.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObsercureText = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: StringsManager.email,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return StringsManager.enterValidEmail;
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(HeightSizeManager.h18),
          AppTextFormField(
              hintText: StringsManager.password,
              validator: (value) {
                if (value == null ||
                    value.isEmpty
                   ) {
                  return StringsManager.enterValidPassword;
                }
              },
              controller: context.read<LoginCubit>().passwordController,
              isObsecureText: isObsercureText,
              suffixIcon: IconButton(
                icon: Icon(
                  isObsercureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.gray,
                ),
                onPressed: () {
                  setState(() {
                    isObsercureText = !isObsercureText;
                  });
                },
              )),
          verticalSpace(HeightSizeManager.h24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();

  }
}
