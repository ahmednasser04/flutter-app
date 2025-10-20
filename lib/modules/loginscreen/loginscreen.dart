import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:health_care_project/modules/forgetpasswordscreen/forgetpasswordscreen.dart';

import 'package:health_care_project/shared/component/defaultTextButton/defaultTextButton.dart';

import 'package:health_care_project/shared/component/defaultTextFormField/defaultTextFormField.dart';

import 'package:health_care_project/shared/component/defaultbutton/defaultbutton.dart';

import '../../features/auth/register_user_screen.dart';

class Loginscreen extends StatefulWidget {
  static const String routeName = "Loginscreen";

  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  static final String _registerRoute = RegisterUserScreen.routeName;

  bool userIconsTap = false;

  bool doctorIconsTap = false;

  bool isLogin = true;

  bool isRegiser = false;

  bool obsecure = true;

  bool checkboxValue = false;

  void _navigateToRegister() {
    Navigator.of(context).pushReplacementNamed(_registerRoute);
  }

  BoxDecoration _modalBottomSheetDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,

        width: 1.sw,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(71, 134, 245, 1),

              Color.fromRGBO(43, 115, 243, 1),

              Color.fromRGBO(48, 119, 243, 1),
            ],
          ),
        ),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          
            children: [
              Container(
                height: .30.sh,
          
                width: double.infinity,
          
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
          
                    end: Alignment.centerLeft,
          
                    colors: [
                      Color.fromRGBO(255, 255, 255, .3),
          
                      Color.fromRGBO(255, 255, 255, .04),
                    ],
                  ),
                ),
          
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
          
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
          
                        crossAxisAlignment: CrossAxisAlignment.start,
          
                        children: [
                          SizedBox(height: 15.h),
          
                          Text(
                            "لوجو",
          
                            style: TextStyle(
                              fontSize: 32.sp,
          
                              fontWeight: FontWeight.bold,
          
                              color: Color.fromRGBO(10, 69, 87, 1),
                            ),
                          ),
          
                          Text(
                            "أبدأ الان",
          
                            style: TextStyle(
                              fontSize: 32.sp,
          
                              fontWeight: FontWeight.bold,
          
                              color: Color.fromRGBO(238, 238, 238, 1),
                            ),
                          ),
          
                          Text(
                            'معا لتوفير جميع الخدمات الطبية بطريقة افضل',
          
                            style: TextStyle(
                              color: Colors.white,
          
                              fontWeight: FontWeight.w400,
          
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
              ConstrainedBox(
                constraints: BoxConstraints(
              minHeight: .70.sh,
            ),
                child: Container(
                  
                  width: double.infinity,
                          
                  decoration: BoxDecoration(
                    color: Colors.white,
                          
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                          
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                          
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                          
                    child: SizedBox(
                      child: (Column(
                        children: [
                          SizedBox(height: 30.h),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    userIconsTap = true;
                          
                                    doctorIconsTap = false;
                                  });
                                },
                          
                                child: Container(
                                  height: 119.h,
                          
                                  width: 99.w,
                          
                                  decoration: BoxDecoration(
                                    color: userIconsTap
                                        ? Color.fromRGBO(154, 185, 239, 0.55)
                                        : Color.fromRGBO(237, 241, 243, 1),
                          
                                    border: Border.all(
                                      color: Color.fromRGBO(237, 241, 243, 1),
                          
                                      width: 1.w,
                                    ),
                          
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                          
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/user_logo.png',
                                        ),
                                      ),
                          
                                      Text(
                                        "مستخدم عادي",
                          
                                        style: TextStyle(
                                          fontSize: 14.sp,
                          
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          
                              SizedBox(width: 20.w),
                          
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    doctorIconsTap = true;
                          
                                    userIconsTap = false;
                                  });
                                },
                          
                                child: Container(
                                  height: 119.h,
                          
                                  width: 99.w,
                          
                                  decoration: BoxDecoration(
                                    color: doctorIconsTap
                                        ? Color.fromRGBO(154, 185, 239, 0.55)
                                        : Color.fromRGBO(237, 241, 243, 1),
                          
                                    border: Border.all(
                                      color: Color.fromRGBO(237, 241, 243, 1),
                          
                                      width: 1.w,
                                    ),
                          
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                          
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/doctor_logo.png',
                                        ),
                                      ),
                          
                                      SizedBox(height: 8.h),
                          
                                      Text(
                                        "أنا طبيب",
                          
                                        style: TextStyle(
                                          fontSize: 14.sp,
                          
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          SizedBox(height: 25.h),
                          
                          Container(
                            height: 47.h,
                          
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isLogin = true;
                          
                                        isRegiser = false;
                                      });
                                    },
                          
                                    child: Container(
                                      alignment: Alignment.center,
                          
                                      child: Text(
                                        "تسجيل الدخول",
                          
                                        style: TextStyle(
                                          color: isLogin
                                              ? Colors.white
                                              : Colors.black,
                          
                                          fontSize: 14.sp,
                                        ),
                                      ),
                          
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.r),
                          
                                        border: Border.all(
                                          width: 1.w,
                          
                                          color: Color.fromRGBO(
                                            255,
                                            255,
                                            255,
                                            .5,
                                          ),
                                        ),
                          
                                        gradient: isLogin
                                            ? LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(27, 106, 243, 1),
                          
                                                  Color.fromRGBO(27, 106, 243, 1),
                          
                                                  Color.fromRGBO(27, 106, 243, 1),
                                                ],
                                              )
                                            : LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                    255,
                          
                                                    220,
                          
                                                    218,
                          
                                                    218,
                                                  ),
                          
                                                  Color.fromARGB(
                                                    255,
                          
                                                    220,
                          
                                                    218,
                          
                                                    218,
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                          
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      _navigateToRegister();
                          
                                      setState(() {
                                        isLogin = false;
                          
                                        isRegiser = true;
                                      });
                                    },
                          
                                    child: Container(
                                      alignment: Alignment.center,
                          
                                      child: Text(
                                        "إنشاء حساب",
                          
                                        style: TextStyle(
                                          color: isRegiser
                                              ? Colors.white
                                              : Colors.black,
                          
                                          fontSize: 14.sp,
                                        ),
                                      ),
                          
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.r),
                          
                                        border: Border.all(
                                          width: 1.w,
                          
                                          color: Color.fromRGBO(
                                            255,
                                            255,
                                            255,
                                            .5,
                                          ),
                                        ),
                          
                                        gradient: isRegiser
                                            ? LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(27, 106, 243, 1),
                          
                                                  Color.fromRGBO(27, 106, 243, 1),
                          
                                                  Color.fromRGBO(27, 106, 243, 1),
                                                ],
                                              )
                                            : LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                    255,
                          
                                                    220,
                          
                                                    218,
                          
                                                    218,
                                                  ),
                          
                                                  Color.fromARGB(
                                                    255,
                          
                                                    220,
                          
                                                    218,
                          
                                                    218,
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          SizedBox(height: 25.h),
                          
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                          
                                children: [
                                  Text(
                                    "البريد الإلكتورني",
                          
                                    style: TextStyle(
                                      fontSize: 12.sp,
                          
                                      fontWeight: FontWeight.w400,
                          
                                      color: Color.fromRGBO(108, 114, 120, 1),
                                    ),
                                  ),
                          
                                  SizedBox(height: 10.h),
                          
                                  Defaulttextformfield(
                                    hintText: 'ادخل بريدك الالكتروني',
                          
                                    hintStyle: TextStyle(
                                      fontSize: 12.sp,
                          
                                      fontWeight: FontWeight.w400,
                          
                                      color: Color.fromRGBO(108, 114, 120, 1),
                                    ),
                                  ),
                          
                                  SizedBox(height: 25.h),
                          
                                  Text(
                                    "كلمة السر",
                          
                                    style: TextStyle(
                                      fontSize: 12.sp,
                          
                                      fontWeight: FontWeight.w400,
                          
                                      color: Color.fromRGBO(108, 114, 120, 1),
                                    ),
                                  ),
                          
                                  SizedBox(height: 10.h),
                          
                                  Defaulttextformfield(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obsecure = !obsecure;
                                        });
                                      },
                          
                                      icon: Icon(
                                        obsecure
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                      ),
                                    ),
                          
                                    suffixIconColor: Colors.grey,
                          
                                    obscureText: obsecure,
                          
                                    hintText: "ادخل كلمة السر",
                          
                                    hintStyle: TextStyle(
                                      fontSize: 12.sp,
                          
                                      fontWeight: FontWeight.w400,
                          
                                      color: Color.fromRGBO(108, 114, 120, 1),
                                    ),
                                  ),
                                ],
                              ),
                          
                              SizedBox(height: 20.h),
                          
                              Row(
                                children: [
                                  DefaultTextButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                          
                                        context: context,
                          
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(
                                                context,
                                              ).viewInsets.bottom,
                                            ),
                          
                                            child: Container(
                                              height: .50.sh,
                                              decoration: _modalBottomSheetDecoration(),
                                                                      
                                              //  height: 327.h,
                                              padding: EdgeInsets.all(20.w),
                                                                      
                                              child: Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                                      
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                                      
                                                      children: [
                                                        Container(
                                                          height: 5.h,
                                                                      
                                                          width: 50.w,
                                                                      
                                                          decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                  17,
                                                                      
                                                                  24,
                                                                      
                                                                  39,
                                                                      
                                                                  1,
                                                                ),
                                                                      
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10.r,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                                      
                                                    SizedBox(height: 15.h),
                                                                      
                                                    Text(
                                                      "اعادة تعيين كلمة السر",
                                                                      
                                                      style: TextStyle(
                                                        fontSize: 21.sp,
                                                                      
                                                        fontWeight:
                                                            FontWeight.bold,
                                                                      
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                                      
                                                    SizedBox(height: 20.h),
                                                                      
                                                    Text(
                                                      'البريد الالكتروني او رقم الهاتف',
                                                                      
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                                      
                                                        fontWeight:
                                                            FontWeight.w500,
                                                                      
                                                        color: Color.fromRGBO(
                                                          108,
                                                                      
                                                          114,
                                                                      
                                                          120,
                                                                      
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                                      
                                                    Defaulttextformfield(),
                                                                      
                                                    SizedBox(height: 20.h),
                                                                      
                                                    DefaultButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                                      
                                                          MaterialPageRoute(
                                                            builder: (context) {
                                                              return ForgetPasswordScreen();
                                                            },
                                                          ),
                                                        );
                                                      },
                                                                      
                                                      buttonText:
                                                          'ارسال رابط تغيير كلمة السر',
                                                    ),
                                                                      
                                                    SizedBox(height: 20.h),
                                                                      
                                                    DefaultButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                                      
                                                      buttonText: 'إلغاء',
                                                                      
                                                      backgroundColor:
                                                          Colors.white,
                                                                      
                                                      foregroundColor:
                                                          Colors.black,
                                                                      
                                                      boderColor: Colors.black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                          
                                    textButtonTitle: 'نسيت كلمة السر ؟',
                                  ),
                          
                                  Spacer(),
                          
                                  Text(
                                    'تذكر البيانات',
                          
                                    // style: TextStyle(fontSize: 12),
                                  ),
                          
                                  Checkbox(
                                    checkColor: Colors.white,
                          
                                    activeColor: Colors.blue,
                          
                                    value: checkboxValue,
                          
                                    onChanged: (value) {
                                      setState(() {
                                        checkboxValue = !checkboxValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                          
                              SizedBox(height: 20.h),
                          
                              DefaultButton(
                                onPressed: () {},
                          
                                buttonText: 'تسجيل الدخول',
                              ),
                            ],
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
