import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:health_care_project/shared/component/defaultTextFormField/defaultTextFormField.dart';
import 'package:health_care_project/shared/component/defaultbutton/defaultbutton.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../login/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = "ResetPasswordScreen";

  final String email;
  final String code;

  const ResetPasswordScreen({super.key, required this.email, required this.code});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;
  bool isSubmitted = false;

  bool get isPasswordMatched => newPasswordController.text == confirmPasswordController.text;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("تعيين كلمة سر جديدة", style: TextStyle(fontSize: 18.sp)),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("تم تغيير كلمة السر بنجاح! يرجى تسجيل الدخول."),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pushNamedAndRemoveUntil(context, Loginscreen.routeName, (route) => false);
            } else if (state is ResetPasswordErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("فشل تعيين كلمة السر. الرمز غير صحيح أو خطأ تقني."),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          builder: (context, state) {
            bool isLoading = state is ResetPasswordLoadingState;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "البريد الالكتروني: ${widget.email}",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 30.h),

                  Text("كلمة السر الجديدة", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10.h),
                  Defaulttextformfield(
                    controller: newPasswordController,
                    hintText: "••••••••",
                    obscureText: obscureNewPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureNewPassword = !obscureNewPassword;
                        });
                      },
                    ),
                    borderColor: (isSubmitted && newPasswordController.text.isEmpty)
                        ? Colors.redAccent : null,
                  ),

                  SizedBox(height: 20.h),

                  Text("تأكيد كلمة السر الجديدة", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10.h),
                  Defaulttextformfield(
                    controller: confirmPasswordController,
                    hintText: "••••••••",
                    obscureText: obscureConfirmPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureConfirmPassword = !obscureConfirmPassword;
                        });
                      },
                    ),
                    borderColor: (isSubmitted && !isPasswordMatched)
                        ? Colors.redAccent : null,
                  ),

                  SizedBox(height: 30.h),

                  DefaultButton(
                    buttonText: isLoading ? "جاري التعيين..." : "تعيين كلمة السر",
                    onPressed: isLoading ? null : () {
                      setState(() {
                        isSubmitted = true;
                      });

                      if (newPasswordController.text.isEmpty || !isPasswordMatched) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("تأكد من إدخال كلمة السر ومطابقتها."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      AuthCubit.get(context).resetPassword(
                        email: widget.email,
                        newPassword: newPasswordController.text,
                        code: widget.code,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}