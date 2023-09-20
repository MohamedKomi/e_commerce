import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController ageController = TextEditingController();

final GlobalKey<FormState> formKey = GlobalKey();

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isLogin)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff8A91A9)),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  validator: (validate) {
                    if (validate!.isEmpty) {
                      return 'Please enter your name!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  hintText: 'Enter your name',
                  controller: nameController,
                ),
                const SizedBox(height: 20),
                const Text(
                  'phone',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff8A91A9)),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  validator: (validate) {
                    if (validate!.isEmpty) {
                      return 'Please enter your phone number!';
                    } else if (validate.length < 11) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  hintText: 'Enter your phone number',
                  controller: phoneController,
                ),
              ],
            ),
          const SizedBox(height: 20),
          const Text(
            'Email',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color(0xff8A91A9)),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            validator: (validate) {
              if (validate!.isEmpty) {
                return 'Please enter your email!';
              } else if (!validate.contains('@') ||
                  !validate.contains('.com')) {
                return 'Please enter a valid email!';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            hintText: 'Enter your email',
            controller: emailController,
          ),
          const SizedBox(height: 20),
          const Text(
            'Password',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color(0xff8A91A9)),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            validator: (validate) {
              if (validate!.isEmpty) {
                return 'Please enter your password!';
              } else if (validate.length < 6) {
                return 'Please enter at least 6 letters!';
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Enter your password',
            controller: passwordController,
          ),
        ],
      ),
    );
  }
}
