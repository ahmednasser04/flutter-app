import 'package:flutter/material.dart';
import 'package:health_care_project/modules/loginscreen/loginscreen.dart';
import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_colors.dart';
import '../../shared/component/defaultTextFormField/defaultTextFormField.dart';
import '../../shared/component/defaultbutton/defaultbutton.dart';


class RegisterUserScreen extends StatefulWidget {
  static const String routeName = "RegisterUserScreen";
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}


class _RegisterUserScreenState extends State<RegisterUserScreen> {
  bool isDoctor = false;
  bool isSubmitted = false;
  bool isRegisterTabSelected = true;
  String selectedGender = '';
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String fullPhoneNumber = '';
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isPasswordMatched = true;
  bool hasUpperLower = false;
  bool hasNumber = false;
  bool hasSymbol = false;
  bool hasMinLength = false;

  void _navigateToLogin() {
    Navigator.pushNamed(context, Loginscreen.routeName);
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthDateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h, top: 8.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: const Color.fromRGBO(90, 97, 104, 1),
        ),
      ),
    );
  }

  void _validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    setState(() {
      isEmailValid = emailRegex.hasMatch(value);
    });
  }

  void _validatePassword(String value) {
    setState(() {
      hasUpperLower = value.contains(RegExp(r'(?=.*[a-z])(?=.*[A-Z])'));
      hasNumber = value.contains(RegExp(r'[0-9]'));
      hasSymbol = value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>/]'));
      hasMinLength = value.length >= 8;
      isPasswordValid = hasUpperLower && hasNumber && hasSymbol && hasMinLength;
      isPasswordMatched = passwordController.text == confirmPasswordController.text;
    });
  }

  Widget _buildCheck(String text, bool condition) {
    return Row(
      children: [
        Icon(
          condition ? Icons.check_circle : Icons.cancel,
          color: condition ? Colors.green : Colors.redAccent,
          size: 18.sp,
        ),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(
            color: condition ? Colors.green : Colors.redAccent,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildUserTypeSelector() {

    const Color selectedColor = Color.fromRGBO(154, 185, 239, 0.55);
    const Color unselectedColor = Color.fromRGBO(237, 241, 243, 1);
    const double iconContainerHeight = 119;
    const double iconContainerWidth = 99;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isDoctor = false;
            });
          },
          child: Container(
            height: 119.h,
            width: 99.w,
            decoration: BoxDecoration(
              color: isDoctor
                  ? unselectedColor
                  : selectedColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isDoctor ? unselectedColor : AppColors.primaryBlue,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/images/user_logo.png')),
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

        GestureDetector(
          onTap: () {
            setState(() {
              isDoctor = true;
            });
          },
          child: Container(
            height: 119.h,
            width: 99.w,
            decoration: BoxDecoration(
              color: isDoctor ? selectedColor : unselectedColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isDoctor ? AppColors.primaryBlue : unselectedColor,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Image.asset('assets/images/doctor_logo.png')),
                SizedBox(height: 8.h),
                Text(
                  "أنا طبيب",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelector() {
    const Color selectedColor = Color.fromRGBO(154, 185, 239, 0.55);
    const Color unselectedColor = Color.fromRGBO(237, 241, 243, 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabel("النوع"),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'male';
                });
              },
              child: Container(
                height: 60.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: selectedGender == 'male' ? selectedColor : unselectedColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: selectedGender == 'male'
                        ? AppColors.primaryBlue
                        : Colors.white,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male,
                      color: selectedGender == 'male'
                          ? AppColors.primaryBlue
                          : Colors.grey,
                      size: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "ذكر",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'female';
                });
              },
              child: Container(
                height: 60.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: selectedGender == 'female' ? selectedColor : unselectedColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: selectedGender == 'female'
                        ? AppColors.primaryBlue
                        : Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.female,
                      color: selectedGender == 'female'
                          ? AppColors.primaryBlue
                          : Colors.grey,
                      size: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "أنثى",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAuthTabBar() {
    const Color selectedBackground = Color.fromRGBO(27, 106, 243, 1);
    const Color unselectedBackground = Color.fromARGB(255, 220, 218, 218);

    return Container(
      height: 47.h,
      decoration: BoxDecoration(
        color: unselectedBackground,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isRegisterTabSelected = true;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: isRegisterTabSelected ? selectedBackground : unselectedBackground,
                ),
                child: Text(
                  "إنشاء حساب",
                  style: TextStyle(
                    color: isRegisterTabSelected ? Colors.white : Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                _navigateToLogin();
                setState(() {
                  isRegisterTabSelected = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: isRegisterTabSelected ? unselectedBackground : selectedBackground,
                ),
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    color: isRegisterTabSelected ? Colors.black : Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 15.h),
              _buildUserTypeSelector(),

              SizedBox(height: 25.h),

              _buildAuthTabBar(),

              SizedBox(height: 25.h),


              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildLabel("الاسم الاول"),
                        Defaulttextformfield(
                          controller: firstNameController,
                          hintText: "الاسم الاول",
                          borderColor: (isSubmitted && firstNameController.text.isEmpty)
                              ? Colors.redAccent
                              : null,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildLabel("الاسم الأخير"),
                        Defaulttextformfield(
                          controller: lastNameController,
                          hintText: "الاسم الأخير",
                          borderColor: (isSubmitted && lastNameController.text.isEmpty)
                              ? Colors.redAccent
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              buildLabel("البريد الإلكتروني"),
              Defaulttextformfield(
                controller: emailController,
                hintText: "example@email.com",
                onChanged: _validateEmail,
                suffixIcon: Icon(
                  isEmailValid ? Icons.check_circle : Icons.cancel,
                  color: isEmailValid ? AppColors.green : Colors.redAccent,
                  size: 22.sp,
                ),
                borderColor: (isSubmitted && !isEmailValid) ? Colors.redAccent : null,
              ),

              SizedBox(height: 16.h),

              buildLabel("رقم الهاتف"),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: (isSubmitted && fullPhoneNumber.isEmpty)
                        ? Colors.redAccent
                        : Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: PhoneFormField(
                  countrySelectorNavigator: const CountrySelectorNavigator.modalBottomSheet(),
                  decoration: InputDecoration(
                    hintText: '0123456789',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
                  ),
                  countryButtonStyle: const CountryButtonStyle(showFlag: true),
                  onChanged: (phoneNumber) {
                    if (phoneNumber != null) {
                      fullPhoneNumber = phoneNumber.international;
                    }
                  },
                ),
              ),

              SizedBox(height: 16.h),

              buildLabel("تاريخ الميلاد"),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: AbsorbPointer(
                  child: Defaulttextformfield(
                    controller: birthDateController,
                    hintText: "01-03-2004",
                    suffixIcon: Icon(Icons.calendar_today_rounded, color: Colors.grey, size: 20.sp),
                    borderColor: (isSubmitted && birthDateController.text.isEmpty)
                        ? Colors.redAccent
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              _buildGenderSelector(),

              SizedBox(height: 16.h),

              buildLabel("كلمة المرور"),
              Defaulttextformfield(
                controller: passwordController,
                hintText: "••••••••",
                obscureText: obscurePassword,
                onChanged: _validatePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: 22.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
                borderColor: (isSubmitted && (!isPasswordValid || passwordController.text.isEmpty))
                    ? Colors.redAccent
                    : null,
              ),

              SizedBox(height: 16.h),

              buildLabel("تأكيد كلمة المرور"),
              Defaulttextformfield(
                controller: confirmPasswordController,
                hintText: "••••••••",
                obscureText: obscureConfirmPassword,
                onChanged: (val) {
                  _validatePassword(passwordController.text);
                  setState(() {
                    isPasswordMatched = val == passwordController.text;
                  });
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: 22.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureConfirmPassword = !obscureConfirmPassword;
                    });
                  },
                ),
                borderColor: (isSubmitted && !isPasswordMatched)
                    ? Colors.redAccent
                    : null,
              ),

              SizedBox(height: 14.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCheck("كلمة السر تحتوي على 8 أحرف", hasMinLength),
                  _buildCheck("تحتوي على حرف كبير وصغير", hasUpperLower),
                  _buildCheck("تحتوي على رقم", hasNumber),
                  _buildCheck("تحتوي على رمز مثل @ أو /", hasSymbol),
                  _buildCheck("كلمة السر متطابقة", isPasswordMatched),
                ],
              ),

              SizedBox(height: 24.h),

              DefaultButton(
                buttonText: "إنشاء حساب",
                onPressed: () {
                  setState(() {
                    isSubmitted = true;
                  });

                  if (firstNameController.text.isEmpty ||
                      lastNameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      fullPhoneNumber.isEmpty ||
                      birthDateController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("من فضلك املأ كل الحقول المطلوبة"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                    return;
                  }

                  if (!isPasswordMatched || !isPasswordValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("تأكد من صحة كلمة المرور ومطابقتها"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("تم إنشاء الحساب بنجاح!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  print("Registering as Doctor: $isDoctor");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}