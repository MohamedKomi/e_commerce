import 'package:ecommerce/core/utils/app_router.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/shared_data.dart';
import '../../../splash/presentation/views/widgets/splash_text.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/onBoarding.jpeg'),
            const SplashText(),
            CustomButton(
                color: const Color(0xff69BCFC),
                text: 'Get Started',
                onPressed: () {
                  SharedData.saveFirst(first: true);
                  GoRouter.of(context).pushReplacement(AppRouter.kAuthView);
                }),
          ],
        ),
      ),
    );
  }
}
