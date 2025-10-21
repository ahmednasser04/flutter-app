import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care_project/features/auth/reset_password/reset_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care_project/shared/component/defaultTextButton/defaultTextButton.dart';
import 'package:health_care_project/shared/component/defaultTextFormField/defaultTextFormField.dart';
import 'package:health_care_project/shared/component/defaultbutton/defaultbutton.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';



class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = "ForgetPasswordScreen";

  final String email;

  const ForgetPasswordScreen({super.key, required this.email});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final TextEditingController pinCodeController = TextEditingController();
  String enteredPinCode = '';
  bool isSubmitted = false;

  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {

            if (state is VerifyCodeSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("تم التحقق بنجاح! يمكنك الآن تعيين كلمة سر جديدة."),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => ResetPasswordScreen(
                  email: widget.email,
                  code: enteredPinCode,
                ),
              ));

            } else if (state is VerifyCodeErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("الرمز غير صحيح أو انتهت صلاحيته. حاول مرة أخرى."),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }

            if (state is RequestResetSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("تم إعادة إرسال رمز التحقق بنجاح."),
                  backgroundColor: Colors.blue,
                ),
              );
            } else if (state is RequestResetErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("فشل في إعادة الإرسال."),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          builder: (context, state) {
            bool isVerifying = state is VerifyCodeLoadingState;
            bool isResending = state is RequestResetLoadingState;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    'الرمز المتغير',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(43, 40, 41, 1),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "نحن نتأكد من ملكية البريد الالكتروني لحماية حسابك وبياناتك الخاصة",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(43, 40, 41, 1),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "البريد الالكتروني",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(108, 114, 120, 1),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Defaulttextformfield(
                    initialValue: widget.email,
                    readOnly: true,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'قم بإدخال الرمز المتغير',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(64, 64, 64, 1),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PinCodeTextField(
                      length: 5,
                      controller: pinCodeController,
                      appContext: context,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          enteredPinCode = value;
                        });
                      },
                      enableActiveFill: true,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5.r),
                        fieldHeight: 50.h,
                        fieldWidth: 50.w,
                        activeFillColor: const Color.fromRGBO(12, 61, 173, 0.02),
                        inactiveFillColor: const Color.fromRGBO(12, 61, 173, 0.02),
                        selectedFillColor: const Color.fromRGBO(12, 61, 173, 0.02),
                        activeColor: Colors.blue,
                        inactiveColor: const Color.fromRGBO(207, 219, 236, 1),
                        selectedColor: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "لم تستلم الرمز؟",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(48, 54, 81, 1),
                            ),
                          ),
                          DefaultTextButton(
                            textButtonTitle: isResending ? 'جاري الإرسال...' : 'إعادة إرسال',
                            onPressed: isResending ? null : () {
                              AuthCubit.get(context).requestPasswordReset(
                                email: widget.email,
                              );
                            },
                            textButtonColor: const Color.fromRGBO(27, 106, 243, 1),
                          ),
                        ],
                      ),
                      Text(
                        'إعادة إرسال خلال 30ث',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(48, 54, 81, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),

                  DefaultButton(
                    buttonText: isVerifying ? 'جاري التحقق...' : 'تأكيد واستمرار',
                    onPressed: isVerifying ? null : () {
                      setState(() {
                        isSubmitted = true;
                      });
                      if (enteredPinCode.length != 5) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("من فضلك أدخل الرمز المكون من 5 أرقام."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }
                      AuthCubit.get(context).verifyResetCode(
                        email: widget.email,
                        code: enteredPinCode,
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