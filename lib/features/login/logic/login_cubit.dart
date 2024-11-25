import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/models/login_request_body.dart';
import '../data/models/login_response.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: "login_form");

  void emitLoadingState() async {
    emit(const LoginState.loading());
    final ApiResult<LoginResponse> result = await _loginRepo.login(
        LoginRequestBody(
            email: emailController.text, password: passwordController.text));

    result.when(
        success: (LoginResponse loginResponse) =>
            emit(LoginState.success(loginResponse)),
        failure: (error) =>
            emit(LoginState.error(error: error.apiErrorModel.message ?? "")));
  }
}
