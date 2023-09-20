import 'package:ecommerce/core/utils/app_router.dart';
import 'package:ecommerce/core/utils/shared_data.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    String? token = SharedData.getToken();
    bool? first = SharedData.getFirst();

    if (first != true) {
      navigateToOnBoarding();
    } else {
      if (token != null) {
        navigateToHome();
      } else {
        navigateToAuth();
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff69BCFC),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .4,
            ),
            Text(
              'FLIP',
              style: GoogleFonts.italianno().copyWith(
                  fontSize: 50 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Text(
              'Discover all trendy products',
              style: TextStyle(fontSize: size.width * .06),
            ),
            SizedBox(
              height: size.height * .35,
            ),
            Text(
              'Powered by AppShark',
              style: TextStyle(
                  fontSize: 15 * MediaQuery.of(context).textScaleFactor),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
    });
  }

  void navigateToAuth() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement(AppRouter.kAuthView);
    });
  }

  void navigateToOnBoarding() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement(AppRouter.konBoardingView);
    });
  }
}
