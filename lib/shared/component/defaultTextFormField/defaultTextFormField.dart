import 'package:flutter/material.dart';

class Defaulttextformfield extends StatelessWidget {
   Defaulttextformfield({this.obscureText, this.controller,this.hintStyle,this.hintText
   ,this.onFieldSubmitted,this.prefixIcon,this.prefixIconColor
   ,this.suffixIcon,this.suffixIconColor,super.key});
Widget? prefixIcon;
Color? prefixIconColor;
Widget? suffixIcon;
Color? suffixIconColor;
String? hintText;
TextStyle? hintStyle;
TextEditingController? controller;
bool?   obscureText;
Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      obscureText: obscureText??false,
      
      decoration: InputDecoration(
        
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        hintText: hintText,
        hintStyle: hintStyle,
        
        
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            
            color:Colors.blueAccent ,
            width: 1,),
          borderRadius: BorderRadius.circular(10)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            
            color:Colors.red ,
            width: 1,),
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            
            color:Color.fromRGBO(237, 241, 243, 1) ,
            width: 1,),
          borderRadius: BorderRadius.circular(10)
        ),
        
        
      ),
    );
  }
}