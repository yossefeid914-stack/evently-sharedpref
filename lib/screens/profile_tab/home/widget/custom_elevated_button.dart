import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  Widget child;
  Color? backgroundColor;
  Color? borderSideColor;

   CustomElevatedButton({super.key,required this.onPressed,required this.child,this.borderSideColor,this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor?? AppColors.mainColor,
padding:EdgeInsets.symmetric(vertical: height*0.02) ,
shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
  side: BorderSide(color:borderSideColor??AppColors.transparentColor ,width: 1)
        )
        ),
        onPressed: onPressed,
child: child,
         );
  }
}
