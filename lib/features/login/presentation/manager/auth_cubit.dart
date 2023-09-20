import 'package:ecommerce/features/login/data/auth_model/auth_model.dart';
import 'package:ecommerce/features/login/data/repositories/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  bool isLogin = true;

  void onPressed() {
    isLogin = !isLogin;
    emit(AuthInitial());
  }

  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final res = await authRepo.login(email, password);

    res.fold((failure) {
      emit(AuthFailure(failure.errorMessage));
    }, (login) {
      emit(AuthSuccess(login));
    });
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(AuthLoading());
    final res = await authRepo.register(email, password, phone, name);

    res.fold((failure) {
      emit(AuthFailure(failure.errorMessage));
    }, (register) {
      emit(AuthSuccess(register));
    });
  }
}
