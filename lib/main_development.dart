import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependancy_injection.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp( DocApp(appRouter: AppRouter()));
}