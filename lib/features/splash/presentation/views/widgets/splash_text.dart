import 'package:flutter/material.dart';

class SplashText extends StatelessWidget {
  const SplashText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The',
          style: TextStyle(
              color: const Color(0xff0D111F),
              fontSize: 50 * MediaQuery.of(context).textScaleFactor,
              shadows: const [
                Shadow(
                    color: Colors.white,
                    blurRadius: 10,
                    offset: Offset.infinite),
                Shadow(color: Colors.white, blurRadius: 10),
                Shadow(color: Colors.white, blurRadius: 10)
              ],
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Text(
          'Awesome',
          style: TextStyle(
              fontSize: 50 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Text(
          'Branded',
          style: TextStyle(
              color: const Color(0xff0D111F),
              fontSize: 50 * MediaQuery.of(context).textScaleFactor,
              shadows: const [
                Shadow(
                    color: Colors.white,
                    blurRadius: 10,
                    offset: Offset.infinite),
                Shadow(color: Colors.white, blurRadius: 10),
                Shadow(color: Colors.white, blurRadius: 10)
              ],
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Text(
          'Products',
          style: TextStyle(
              fontSize: 50 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Text(
          'Enjoy your vacation with our super comfy products',
          style: TextStyle(
              color: const Color(0xff8A91A9),
              fontSize: 20 * MediaQuery.of(context).textScaleFactor),
        ),
        SizedBox(
          height: size.height * .03,
        ),
      ],
    );
  }
}
