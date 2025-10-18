import 'package:flutter/material.dart';
import 'package:health_care_project/shared/component/defaultTextButton/defaultTextButton.dart';
import 'package:health_care_project/shared/component/defaultTextFormField/defaultTextFormField.dart';
import 'package:health_care_project/shared/component/defaultbutton/defaultbutton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
        
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                Text(
                  'الرمز المتغير',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(43, 40, 41, 1),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "نحن نتأكد من ملكية رقم الهاتف لحماية حسابك وبياناتك الخاصة",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(43, 40, 41, 1),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "رقم الهاتف",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(108, 114, 120, 1),
                  ),
                ),
                SizedBox(height: 10),
                Defaulttextformfield(),
                SizedBox(height: 20),
                Text(
                  'قم بإدخال الرمز المتغير',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(64, 64, 64, 1),
                  ),
                ),
                SizedBox(height: 10),
            
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
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Color.fromRGBO(12, 61, 173, 0.02), 
                      inactiveFillColor:  Color.fromRGBO(12, 61, 173, 0.02), 
                      selectedFillColor: Color.fromRGBO(12, 61, 173, 0.02),  
                      activeColor: Colors.blue, 
                      inactiveColor: Color.fromRGBO(207, 219, 236, 1) ,
                      selectedColor: Colors.blue, 
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Row(
        
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(
                        "لم تستلم الرمز؟",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(48, 54, 81, 1)
                        ),
                      ),
                    
                      DefaultTextButton(textButtonTitle:'إعادة إرسال', onPressed: (){},
                      textButtonColor: Color.fromRGBO(27, 106, 243, 1), )
                      ,
                    ]
                    
                    
                    ,),
                      Text(  'إعادة إرسال خلال 30ث',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(48, 54, 81, 1)
                      ),
                      ),
                  ],
                ),
              
                SizedBox(height: 30),
                DefaultButton(onPressed: (){
        
                }, buttonText:'تأكيد واستمرار')
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
