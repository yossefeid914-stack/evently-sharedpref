import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/screens/provider/app_language_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageButtomSheet extends StatelessWidget {
  const LanguageButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: height*0.02,
        children: [
          InkWell(
        onTap: (){
languageProvider.changeLanguage('en');
        },
            child: languageProvider.appLanguage=='en'?
            getSelectedItem(context: context,
                language: AppLocalizations.of(context)!.english):
            getUnSelectedItem(context: context, language: AppLocalizations.of(context)!.english)
          ),
          InkWell(
          onTap: (){
            languageProvider.changeLanguage('ar');
          }
          ,child:languageProvider.appLanguage=='ar'?getSelectedItem(context: context,
              language: AppLocalizations.of(context)!.arabic):
          getUnSelectedItem(context: context, language: AppLocalizations.of(context)!.arabic)
          ),


        ],
      ),
    );
  }
  Widget getSelectedItem({required BuildContext context,required String language}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style: AppStyles.semi20StrokeDarkColor),
        Icon(Icons.check,color: AppColors.primaryLight,size: 30,)
      ],
    );
  }
  Widget getUnSelectedItem({required BuildContext context,required String language}){
    return Text(language,
    style: AppStyles.semi20Black,);
  }
}
