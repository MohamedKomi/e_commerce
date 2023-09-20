import 'package:ecommerce/core/utils/app_router.dart';
import 'package:ecommerce/core/utils/shared_data.dart';
import 'package:flutter/material.dart';

import 'core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedData.init();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xff0D111F)),
    );
  }
}
