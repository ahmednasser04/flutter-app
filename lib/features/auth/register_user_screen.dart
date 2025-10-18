import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../core/app_colors.dart';
import '../../shared/component/defaultTextButton/defaultTextButton.dart';
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

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String fullPhoneNumber = '';

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
      padding: const EdgeInsets.only(bottom: 6, top: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(90, 97, 104, 1),
        ),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              buildLabel("الاسم الاول"),
              Row(
                children: [
                  Expanded(
                    child: Defaulttextformfield(
                      controller: firstNameController,
                      hintText: "الاسم الاول",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Defaulttextformfield(
                      controller: lastNameController,
                      hintText: "الاسم الأخير",
                    ),
                  ),
                ],
              ),
              const SizedBox(height:16),
              buildLabel("البريد الإلكتروني"),
              Defaulttextformfield(
                controller: emailController,
                hintText: "example@email.com",
                suffixIcon: const Icon(Icons.check_circle,color:AppColors.green),
              ),
              const SizedBox(height:16),
              buildLabel("رقم الهاتف"),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: PhoneFormField(
                  countrySelectorNavigator: const CountrySelectorNavigator.modalBottomSheet(),
                  decoration: InputDecoration(
                    hintText: '0123456789',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  ),
                  countryButtonStyle: const CountryButtonStyle(
                    showFlag: true,
                  ),
                  onChanged: (phoneNumber) {
                    if (phoneNumber != null) {
                      fullPhoneNumber = phoneNumber.international;
                      print("Full Phone Number: $fullPhoneNumber");
                    }
                  },
                ),
              ),
              const SizedBox(height:16),
              buildLabel("تاريخ الميلاد"),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: AbsorbPointer(
                  child: Defaulttextformfield(
                    controller: birthDateController,
                    hintText: "اختر تاريخ ميلادك",
                    suffixIcon: const Icon(Icons.calendar_today_rounded,color:Colors.grey,),
                  ),
                ),
              ),
              const SizedBox(height:16),
              buildLabel("كلمة المرور"),
              Defaulttextformfield(
                controller: passwordController,
                hintText: "••••••••",
                suffixIcon: const Icon(Icons.remove_red_eye_outlined,color:Colors.grey),
                obscureText: true,
              ),
              const SizedBox(height:16),
              buildLabel("تأكيد كلمة المرور"),
              Defaulttextformfield(
                controller: confirmPasswordController,
                hintText: "أعد كتابة كلمة المرور",
                suffixIcon: const Icon(Icons.remove_red_eye_outlined,color:Colors.grey),
                obscureText: true,
              ),
              const SizedBox(height: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("كلمة السر متطابقة"),
                  Text("كلمة السر 8 حروف"),
                  Text("كلمة السر تحتوي على ارقام"),
                  Text("كلمة السر تحتوي على رموز مثل@/"),
                ],
              ),
              const SizedBox(height: 24),
              DefaultButton(
                buttonText: "إنشاء حساب",
                onPressed: () {
                 print("Full Phone Number on Register: $fullPhoneNumber");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}