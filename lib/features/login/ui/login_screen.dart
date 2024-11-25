
import 'package:doc_app/features/login/ui/widgets/dont_have_account.dart';
import 'package:doc_app/features/login/ui/widgets/email_and_password.dart';
import 'package:doc_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doc_app/features/login/ui/widgets/terms_and_condations_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/resourses/height_size_manager.dart';
import '../../../common/resourses/strings_manager.dart';
import '../../../common/resourses/width_size_manager.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Text(StringsManager.welcomeAccount,
                    style: TextStyleManager.font24BlueBBold),
                verticalSpace(HeightSizeManager.h8),
                Text(StringsManager.subTitleLogin,
                    style: TextStyleManager.font14grayRegular),
                verticalSpace(HeightSizeManager.h36),
                Column(children: [
                  const EmailAndPassword(),
                  verticalSpace(HeightSizeManager.h24),
                  //AlignmentDirectional for arabic and English in localization
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        StringsManager.forgetPassword,
                        style: TextStyleManager.font12BlueRegular,
                      )),
                  verticalSpace(HeightSizeManager.h40),
                  AppTextButton(
                      buttonText: StringsManager.login,
                      onPressed: () {
                        validateThenLogin(context);
                      }, textStyle: TextStyleManager.font16WhiteSemiBold),
                  verticalSpace(HeightSizeManager.h16),
                  const TermsAndCondationsText(),
                  verticalSpace(HeightSizeManager.h60),
                  const AlreadyHaveAccount(),
                  const LoginBlocListener()
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoadingState();
    }
  }
}
