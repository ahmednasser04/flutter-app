import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care_project/core/network/api_constants.dart';
import 'package:hive/hive.dart';
import '../../../core/network/dio.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String role,
    required String gender,
    required String dob,
  }) {
    emit(RegisterLoadingState());

    DioHelper.postData(
      url: ApiConstants.register,
      data: {
        "email": email,
        "name": name,
        "password": password,
        "role": role,
        "gender": gender.toUpperCase(),
        "dob": dob,
      },
    ).then((value) {
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void _saveAuthData(Map<String, dynamic> data) async {
    final authBox = Hive.box('authBox');

    await authBox.put('accessToken', data['tokens']['accessToken']);
    await authBox.put('refreshToken', data['tokens']['refreshToken']);

    await authBox.put('userId', data['date']['payload']['id']);
    await authBox.put('userName', data['date']['payload']['name']);
    await authBox.put('userRole', data['date']['payload']['role']);
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: ApiConstants.login,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      _saveAuthData(value.data);
      emit(LoginSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  Future<void> checkLoggedInUser() async {
    final authBox = Hive.box('authBox');
    final token = authBox.get('accessToken');

    if (token != null && token.isNotEmpty) {
      emit(LoginSuccessState({}));
    } else {
      emit(AuthInitial());
    }
  }

  void requestPasswordReset({required String email}) {
    emit(RequestResetLoadingState());

    DioHelper.postData(
      url: ApiConstants.requestPasswordReset,
      data: {"email": email},
    ).then((value) {
      print(value.data);
      emit(RequestResetSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RequestResetErrorState(error.toString()));
    });
  }

  void resetPassword({
    required String email,
    required String newPassword,
    required String code,
  }) {
    emit(ResetPasswordLoadingState());
    DioHelper.postData(
      url: ApiConstants.resetPassword,
      data: {
        "email": email,
        "newPassword": newPassword,
        "code": code,
      },
    ).then((value) {
      print(value.data);
      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ResetPasswordErrorState(error.toString()));
    });
  }

  void verifyResetCode({
    required String email,
    required String code,
  }) {
    emit(VerifyCodeLoadingState());

    DioHelper.postData(
      url: ApiConstants.verifyResetCode,
      data: {
        "email": email,
        "code": code,
      },
    ).then((value) {
      print(value.data);
      emit(VerifyCodeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(VerifyCodeErrorState(error.toString()));
    });
  }
}