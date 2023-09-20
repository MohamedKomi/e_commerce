import 'package:ecommerce/core/utils/app_router.dart';
import 'package:ecommerce/core/utils/shared_data.dart';
import 'package:ecommerce/features/login/presentation/manager/auth_cubit.dart';
import 'package:ecommerce/features/login/presentation/views/widgets/auth_form.dart';
import 'package:ecommerce/features/login/presentation/views/widgets/auth_hello.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';

class LogInScreenBody extends StatelessWidget {
  const LogInScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (ctx, state) {
        if (state is AuthSuccess) {
          SharedData.saveToken(token: state.authModel.data!.token);
          snackBar(state.authModel.message, context, Colors.white);
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is AuthSuccess) {
          SharedData.saveToken(token: state.authModel.data!.token);

          snackBar(state.authModel.message, context, Colors.white);
          GoRouter.of(context).push(AppRouter.kHomeView);
        }
        if (state is AuthFailure) {
          snackBar(state.errMessage, context, Colors.red);
        }
      },
      builder: (ctx, state) {
        bool isLogin = BlocProvider.of<AuthCubit>(context).isLogin;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHello(
                  isLogin: isLogin,
                ),
                AuthForm(isLogin: isLogin),
                const SizedBox(height: 24),
                if (isLogin)
                  Row(
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xff69BCFC),
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Remember me',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                SizedBox(height: isLogin ? 42 : 20),
                if (state is AuthLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (state is! AuthLoading)
                  CustomButton(
                    color: const Color(0xff69BCFC),
                    text: isLogin ? 'Log in' : 'Sign in',
                    onPressed: () => submit(isLogin, context),
                  ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).onPressed();
                    },
                    child: Text(
                      '${isLogin ? 'SIGNIN' : 'LOGIN'} INSTEAD',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

submit(bool isLogin, BuildContext ctx) async {
  if (!formKey.currentState!.validate()) {
    return;
  }
  formKey.currentState!.save();

  isLogin
      ? await BlocProvider.of<AuthCubit>(ctx)
          .login(email: emailController.text, password: passwordController.text)
      : await BlocProvider.of<AuthCubit>(ctx).register(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          phone: phoneController.text);
}
