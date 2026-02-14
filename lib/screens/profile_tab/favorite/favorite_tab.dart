import 'package:evently/screens/profile_tab/home/widget/custom_text_field.dart';
import 'package:evently/screens/provider/event_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../provider/app_theme_provider.dart';
import '../home/widget/event_item.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late EventListProvider eventListProvider;
  // get themeProvider => null;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){

    eventListProvider.getFavoriteEvents();
    });
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    eventListProvider =Provider.of<EventListProvider>(context);
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(35),bottomLeft: Radius.circular(35))),
          toolbarHeight: height*0.15,
          title:CustomTextField(
            fillColor: themeProvider.isDarkMode()?AppColors.transparentColor
            :AppColors.whiteColor,
            borderSideColor: themeProvider.isDarkMode()?AppColors.mainColor:AppColors.transparentColor,
            filled: true,
            hintText: AppLocalizations.of(context)!.search_for_event,
            hintStyle: themeProvider.isDarkMode()?AppStyles.regular14StrokeWhite:
            AppStyles.regular14Grey,
              suffixIcon: Icon(Icons.search,color:
              themeProvider.isDarkMode()?AppColors.mainDarkColor:
              AppColors.mainColor,size: 35,),
          ) ,

        ),
        body:eventListProvider.favoriteList.isEmpty?
            Center(
              child: Text('no favorite events found.',style: Theme.of(context).textTheme.bodyMedium,),
            ):
        ListView.separated(
            padding: EdgeInsets.symmetric(vertical: height*0.02),


            itemBuilder: (context,index){

              return EventItem(event: eventListProvider.favoriteList[index]);
            },
            separatorBuilder:(context,index){
              return SizedBox(
                height: height*0.02,
              );

            },
            itemCount: eventListProvider.favoriteList.length)


    );
  }
}
