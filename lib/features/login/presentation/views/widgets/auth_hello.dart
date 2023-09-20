import 'package:flutter/material.dart';

class AuthHello extends StatelessWidget {
  const AuthHello({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80),
         Center(
          child: Text(
            isLogin?'LOG IN':'SIGN IN',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 68),
        const Text(
          'Welcome Back!',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 14),
        const Text(
          'Enter password to get back your account',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff13192D),
            fixedSize: const Size(364, 71),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(46),
            ),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/google_icon.png'),
              const SizedBox(
                width: 11,
              ),
              const Text(
                'Continue with Google',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 42),
      ],
    );
  }
}
