import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/screens/profile_tab/home/widget/custom_elevated_button.dart';
import 'package:evently/screens/profile_tab/home/widget/custom_text_field.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_theme_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController(text: 'youssefeid@gmail.com');

  TextEditingController passwordController=TextEditingController(text: '123456');

  var formKey=GlobalKey<FormState>();

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
        key:formKey ,
        child: Column(
          spacing: height*0.04,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.login_to_your_account,
              style:
            themeProvider.isDarkMode()?AppStyles.semi24White:
            AppStyles.semi24MainColor,),

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
              filled:themeProvider.isDarkMode()?false: true,
              fillColor: AppColors.whiteColor,
              borderSideColor:themeProvider.isDarkMode()?AppColors.mainColor: AppColors.strokeColor,
              hintText: AppLocalizations.of(context)!.please_enter_email,
              hintStyle: themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite:AppStyles.regular14Grey,
              prefixIcon: Icon(Icons.mail_outline_outlined,color: AppColors.greyColor,),
            ),

            CustomTextField(
obscureText: true,
              filled: themeProvider.isDarkMode()?false:true,
              fillColor: AppColors.whiteColor,
              borderSideColor: themeProvider.isDarkMode()?AppColors.mainColor:AppColors.strokeColor,
              hintText: AppLocalizations.of(context)!.please_enter_password,
              controller: passwordController,
              obscuringChar: '*',

              validator: (text){
                if(text==null|| text.trim().isEmpty){
                  return 'please enter password';
                }
                if(text.length<6){
                  return 'password should ba at least 6 char';
                }
                return null;
              },
              prefixIcon: Icon(Icons.lock_open_outlined,color: AppColors.greyColor,),
              suffixIcon: Icon(Icons.visibility_off,color: AppColors.greyColor,),
              hintStyle:  themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite:AppStyles.regular14Grey,
            ),


            TextButton(onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        AppLocalizations.of(context)!.forget_password,style: themeProvider.isDarkMode()?
                    AppStyles.semi16Primary.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.mainDarkColor,
                      color: AppColors.mainDarkColor
                    ):
                    AppStyles.semi16Primary.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.mainColor,
                    )),
                  ],
                )),

        CustomElevatedButton(

          onPressed:(){
            login(context);
          } ,
          child:
          Text(AppLocalizations.of(context)!.login,style: AppStyles.medium20White,),
          backgroundColor: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.mainColor,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.dont_have_an_account,style:themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite: AppStyles.regular14Grey,),
                TextButton(onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.registerRouterScreen);
                }, child: Text(AppLocalizations.of(context)!.sign_up,
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
              signInWithGoogle();
            },
                child: Row(
                  spacing: width*0.01,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image.asset("assets/images/googleLogo.png")
                    ,Text('Login With Google',style: themeProvider.isDarkMode()?AppStyles.medium16MainColor.copyWith(color: AppColors.mainDarkColor)
                    :AppStyles.medium16MainColor,)
                  ],
                )
            )
          ],
        ),
      ),
    ),
  ),
) ;

  }

void login(BuildContext context)async{
  if(formKey.currentState?.validate()==true){
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      print('login successfully');
      print('id: ${userCredential.user?.uid??""}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        print('No user found for that email.');
      }
    }catch(e){
      print(e.toString());
    }
  }
Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
}

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
  }
}