
import 'package:doc_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/home_screen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/onboarding/ui/on_boarding_screen.dart';
import '../../features/signup/logic/signup_cubit.dart';
import '../../features/signup/ui/signup_screen.dart';
import '../di/dependancy_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //  this arguments to be passed in any screen  like this (arguments & className)
    final argument = settings.arguments;
    switch (settings.name) {

      case Routes.onBoardingScreen:
        return materialPageBuilder(const OnBoardingScreen());
      case Routes.loginScreen:
        return materialPageBuilder(BlocProvider(
         create: (context) =>getIt<LoginCubit>(),
          child: const LoginScreen(),
        ));
      case Routes.signUpScreen:
        return materialPageBuilder(BlocProvider(
          create: (context) =>getIt<SignupCubit>(),
          child: const SignupScreen(),
        ));
      case Routes.homeScreen:
        return materialPageBuilder(const HomeScreen());
//       case Routes.tipsDetailsPage:
//         if (argument is Map) {
//           return createRoute(TipsDetailPage(tObj: argument));
//         } else {
//           return materialPageBuilder(const ErrorPage());
//         }
//       case Routes.settingsPage:
//         return createRoute(const SettingsPage());
//       case Routes.slectLanguagePage:
//         if (argument is dynamic Function(Map<dynamic, dynamic>)) {
//           return createRoute(SelectLanguagePage(didSelect: argument));
//         } else {
//           return materialPageBuilder(const ErrorPage());
//         }
//       case Routes.connectPage:
//         if (argument is dynamic Function(Map<dynamic, dynamic>)) {
//           return createRoute(ConnectPage(didSelect: argument));
//         } else {
//           return materialPageBuilder(const ErrorPage());
//         }
//       case Routes.runningSettingsPage:
//         return createRoute(const RunningSettingsPage());
      default:
        return materialPageBuilder(const ErrorPage());
    }
  }
}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}

Route createRoute(var page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration:
    const Duration(seconds: 1), // Control the forward transition duration
    reverseTransitionDuration:
    const Duration(seconds: 1), // Control the reverse transition duration
  );
}