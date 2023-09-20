

import 'package:ecommerce/features/login/data/repositories/auth_repo_implementation.dart';
import 'package:ecommerce/features/login/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import 'widgets/login_screen_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(sl<AuthRepoImplementation>()),
      child: const Scaffold(
        body: LogInScreenBody(),
      ),
    );
  }
}
