
import 'package:doc_app/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:doc_app/features/signup/ui/widgets/sign_up_bloc_listener.dart';
import 'package:doc_app/features/signup/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/resourses/height_size_manager.dart';
import '../../../common/resourses/strings_manager.dart';
import '../../../common/resourses/width_size_manager.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/signup_cubit.dart';
import '../../login/ui/widgets/terms_and_condations_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: WidthSizeManager.w30,
              vertical: HeightSizeManager.h30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsManager.signupTitle,
                  style: TextStyleManager.font24BlueBold,
                ),
                verticalSpace(HeightSizeManager.h8),
                Text(
                  StringsManager.signupSubtitle,
                  style: TextStyleManager.font14GrayRegular,
                ),
                verticalSpace(HeightSizeManager.h36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(HeightSizeManager.h40),
                    AppTextButton(
                      buttonText: StringsManager.signupTitle,
                      textStyle: TextStyleManager.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(HeightSizeManager.h16),
                    const TermsAndCondationsText(),
                    verticalSpace(HeightSizeManager.h30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
