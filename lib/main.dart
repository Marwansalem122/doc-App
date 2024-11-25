import 'package:flutter/material.dart';

import 'core/di/dependancy_injection.dart';
import 'core/routing/app_router.dart';
import 'doc_app.dart';

void main() {
  setUpGetIt();
  runApp( DocApp(appRouter: AppRouter()));
}
