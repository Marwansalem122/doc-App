import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependancy_injection.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   // WidgetsFlutterBinding.ensureInitialized();
   // await Firebase.initializeApp(
   //   options: DefaultFirebaseOptions.currentPlatform,
   // );
  setUpGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp( DocApp(appRouter: AppRouter()));
}