import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care_project/core/network/api_constants.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../core/network/dio.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  String _handleDioError(error) {
    String errorMessage = "حدث خطأ غير متوقع.";
    if (error is DioException && error.response != null) {
      final responseData = error.response!.data;

      if (responseData is Map) {
        if (responseData.containsKey('message')) {
          errorMessage = responseData['message'];
        } else if (responseData.containsKey('error')) {
          errorMessage = responseData['error'];
        }
      }
      else if (responseData is String) {
        try {
          final decoded = json.decode(responseData);
          if (decoded is Map && decoded.containsKey('message')) {
            errorMessage = decoded['message'];
          } else {
            errorMessage = responseData;
          }
        } catch (e) {
          errorMessage = responseData;
        }
      } else {
        errorMessage = "خطأ من السيرفر: ${error.response!.statusCode}";
      }

    } else if (error.toString().contains('SocketException')) {
      errorMessage = "خطأ في الاتصال بالشبكة.";
    }
    return errorMessage;
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String role,
    required String gender,
    required String dob,
    required String phone,
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
        "phone": phone,
      },
    ).then((value) {
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(_handleDioError(error)));
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
      emit(LoginErrorState(_handleDioError(error)));
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
      emit(RequestResetErrorState(_handleDioError(error)));
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
        "resetToken": code,
        "password": newPassword,
      },
    ).then((value) {
      print(value.data);
      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ResetPasswordErrorState(_handleDioError(error)));
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
      emit(VerifyCodeSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(VerifyCodeErrorState(_handleDioError(error)));
    });
  }
}