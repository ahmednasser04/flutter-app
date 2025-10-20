import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care_project/shared/component/defaultTextButton/defaultTextButton.dart';
import 'package:health_care_project/shared/component/defaultTextFormField/defaultTextFormField.dart';
import 'package:health_care_project/shared/component/defaultbutton/defaultbutton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:phone_form_field/phone_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  String fullPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
            Defaulttextformfield(),
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
                appContext: context,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
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
                      textButtonTitle: 'إعادة إرسال',
                      onPressed: () {},
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
              onPressed: () {},
              buttonText: 'تأكيد واستمرار',
            ),
          ],
        ),
      ),
    );
  }
}