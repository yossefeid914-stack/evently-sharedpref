import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_theme_provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_styles.dart';
import '../../profile_tab/home/widget/custom_elevated_button.dart';
import '../../profile_tab/home/widget/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  var formKey=GlobalKey<FormState>();
  var emailController=TextEditingController(text: 'youssefeid@gmail.com');
  var passwordController=TextEditingController(text: '123456');
  var nameController=TextEditingController(text: 'youssef');
  var confirmPasswordController=TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor
        ,automaticallyImplyLeading: false,
        title: Image.asset(
            themeProvider.isDarkMode()?"assets/images/darkLogo.png":
            'assets/images/EvenlyLogo.png'),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              spacing: height*0.04,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppLocalizations.of(context)!.create_an_account,style: themeProvider.isDarkMode()?AppStyles.semi24White:
                AppStyles.semi24MainColor,),
                CustomTextField(
                  filled:themeProvider.isDarkMode()?false: true,
                  fillColor: AppColors.whiteColor,
                  borderSideColor:themeProvider.isDarkMode()?AppColors.mainColor: AppColors.strokeColor,
                  hintText: AppLocalizations.of(context)!.please_enter_name,
                  hintStyle: themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite:AppStyles.regular14Grey,
                  prefixIcon: Icon(Icons.person_2_outlined,color: AppColors.greyColor,),
                  controller: nameController,
                  validator: (text){
                    if(text==null|| text.trim().isEmpty){
                      return 'please enter name';
                    }
                    return null;
                  }
                ),
                CustomTextField(
                  controller: emailController,
                    validator: (text){
                      if(text==null|| text.trim().isEmpty){
                        return 'please enter email';
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if(!emailValid){
                        return 'please enter valid email';
                      }

                      return null;
                    },
                  filled: themeProvider.isDarkMode()?false:true,
                  fillColor: AppColors.whiteColor,
                  borderSideColor: themeProvider.isDarkMode()?AppColors.mainColor:AppColors.strokeColor,
                  hintText: AppLocalizations.of(context)!.please_enter_email,
                  prefixIcon: Icon(Icons.mail_outline_outlined,color: AppColors.greyColor,),
                  // suffixIcon: Icon(Icons.visibility_off,color: AppColors.greyColor,),
                  hintStyle:  themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite:AppStyles.regular14Grey,
                ),
                CustomTextField(
                  obscureText: true,
                  obscuringChar: '*',
                  controller: passwordController,
                    validator: (text){
                      if(text==null|| text.trim().isEmpty){
                        return 'please enter password';
                      }
                      if(text.length<6){
                        return 'password should ba at least 6 char';
                      }
                      return null;
                    },
                  filled: themeProvider.isDarkMode()?false:true,
                  fillColor: AppColors.whiteColor,
                  borderSideColor: themeProvider.isDarkMode()?AppColors.mainColor:AppColors.strokeColor,
                  hintText: AppLocalizations.of(context)!.please_enter_password,
                  prefixIcon: Icon(Icons.lock_open_outlined,color: AppColors.greyColor,),
                  suffixIcon: Icon(Icons.visibility_off,color: AppColors.greyColor,),
                  hintStyle:  themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite:AppStyles.regular14Grey,
                ),
                CustomTextField(
                    obscuringChar: '*',
obscureText: true,
                    controller: confirmPasswordController,
                    validator: (text){
                      if(text==null|| text.trim().isEmpty){
                        return 'please enter password';
                      }
                      if(text.length<6){
                        return 'password should ba at least 6 char';
                      }
                      if(text!= passwordController.text){
                        return 'Re-password doesnt match password ';
                      }
                      return null;
                    },
                  filled: themeProvider.isDarkMode()?false:true,
                  fillColor: AppColors.whiteColor,
                  borderSideColor: themeProvider.isDarkMode()?AppColors.mainColor:AppColors.strokeColor,
                  hintText: AppLocalizations.of(context)!.confirm_password,
                  prefixIcon: Icon(Icons.lock_open_outlined,color: AppColors.greyColor,),
                  suffixIcon: Icon(Icons.visibility_off,color: AppColors.greyColor,),
                  hintStyle:  themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite:AppStyles.regular14Grey,
                ),
                CustomElevatedButton(

                  onPressed:(){
                    register(context);
                  } ,
                  child: Text(AppLocalizations.of(context)!.sign_up,style: AppStyles.medium20White,),
                  backgroundColor: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.mainColor,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.already_an_account,style:themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite: AppStyles.regular14Grey,),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushReplacementNamed(AppRoutes.loginRoutesName);
                    }, child: Text(AppLocalizations.of(context)!.login,
                      style:themeProvider.isDarkMode()?
                      AppStyles.medium16MainColor.copyWith(
                          decorationColor: AppColors.mainColor,
                          decoration: TextDecoration.underline ,
                          color: AppColors.mainDarkColor):

                      AppStyles.medium16MainColor.copyWith(
                          decorationColor: AppColors.mainColor,
                          decoration: TextDecoration.underline
                      ),))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: themeProvider.isDarkMode()?AppColors.mainColor:AppColors.greyColor,
                        thickness: 1,
                        indent: width*0.02,
                        endIndent: width*0.05,
                      ),
                    ),Text("Or",style:themeProvider.isDarkMode()?AppStyles.medium16MainColor.copyWith( color: AppColors.mainDarkColor):AppStyles.medium16MainColor),
                    Expanded(
                      child: Divider(
                        color:themeProvider.isDarkMode()?AppColors.mainColor:AppColors.greyColor ,
                        thickness: 1,
                        indent: width*0.02,
                        endIndent: width*0.05,
                      ),
                    )
                  ],
                ),
                CustomElevatedButton(
                    borderSideColor: themeProvider.isDarkMode()?AppColors.mainColor:AppColors.strokeColor,
                    backgroundColor:    themeProvider.isDarkMode()?AppColors.transparentColor:  AppColors.whiteColor
                    ,onPressed: (){
                  //todo:login with google
                },
                    child: Row(
                      spacing: width*0.01,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/googleLogo.png")
                        ,Text('Sign Up With Google',style: themeProvider.isDarkMode()?AppStyles.medium16MainColor.copyWith(color: AppColors.mainDarkColor)
                            :AppStyles.medium16MainColor,)
                      ],
                    )
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  void register(BuildContext context)async {
    if(formKey.currentState?.validate()==true){
      try {
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        print('register successfully');
        print('id: ${userCredential.user?.uid??""}');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    // Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
  }
}
