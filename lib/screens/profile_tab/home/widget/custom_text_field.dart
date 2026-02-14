import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

typedef Validation=void Function(String);
typedef Validator=String? Function(String?)?;
class CustomTextField extends StatelessWidget {
  Color? borderSideColor;
  Color?fillColor;
  bool?filled;
  String ?hintText;
  TextStyle? hintStyle;
  String ?labelText;
  TextStyle? labelStyle;
Widget?prefixIcon;
Widget?suffixIcon;
int?maxLines;
TextEditingController?controller;
  Validation?onChanged;
  Validator?validator;
  bool obscureText;
  String obscuringChar;
   CustomTextField({super.key,this.borderSideColor,this.fillColor,this.filled,this.hintText,
     this.hintStyle,this.labelText,this.labelStyle,this.prefixIcon,this.suffixIcon,this.maxLines,this.controller,
     this.onChanged,this.validator,this.obscureText=false,this.obscuringChar='.'});
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines?? 1,
      validator: validator,
obscureText:obscureText ,
      obscuringCharacter: obscuringChar,
      decoration: InputDecoration(
      enabledBorder: builtDecorationBorder(borderColor: borderSideColor?? AppColors.transparentColor),
      focusedBorder: builtDecorationBorder(borderColor: borderSideColor?? AppColors.transparentColor),
      errorBorder: builtDecorationBorder(borderColor: AppColors.redColor),
      focusedErrorBorder: builtDecorationBorder(borderColor: AppColors.redColor),
      fillColor: fillColor,
      filled: filled,
      hintText: hintText,
      hintStyle: hintStyle,
      labelText: labelText,
      labelStyle: labelStyle,
      prefixIcon:prefixIcon ,
      suffixIcon: suffixIcon

    ),);

  }
  OutlineInputBorder builtDecorationBorder({required Color borderColor}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            width: 2,
            color:borderColor
        )
    );
  }
}
