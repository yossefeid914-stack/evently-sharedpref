import 'package:evently/firebase_utils.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/screens/profile_tab/home/widget/event_item.dart';
import 'package:evently/screens/profile_tab/home/widget/tab_widget.dart';
import 'package:evently/screens/provider/app_language_provider.dart';
import 'package:evently/screens/provider/app_theme_provider.dart';
import 'package:evently/screens/provider/event_list_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
   HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
   // List<String>eventsNameList=[];

late EventListProvider eventListProvider;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);
     eventListProvider=Provider.of<EventListProvider>(context);
eventListProvider.getEventsName(context);
    // eventsNameList=[
    //   AppLocalizations.of(context)!.all,
    //   AppLocalizations.of(context)!.sport,
    //   AppLocalizations.of(context)!.birthday,
    //   AppLocalizations.of(context)!.meeting,
    //   AppLocalizations.of(context)!.book_club,
    //   AppLocalizations.of(context)!.gaming,
    //   AppLocalizations.of(context)!.workshop,
    //   AppLocalizations.of(context)!.exhibition,
    //   AppLocalizations.of(context)!.holiday,
    //   AppLocalizations.of(context)!.eating,
    // ];

    return Scaffold(
      appBar: AppBar(
automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(35),bottomLeft: Radius.circular(35))),
        toolbarHeight: height*0.20,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: height*0.02,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.welcome_back,style: AppStyles.regular14StrokeWhite,),
            Text("Route Academy",style: AppStyles.medium20White,),
                  ],
                ),
                Row(
                  children: [

                Icon(
                  themeProvider.isDarkMode()?
                  Icons.dark_mode_outlined:
                  Icons.light_mode_outlined,
                  color: themeProvider.isDarkMode()?
                  AppColors.mainDarkColor
                      :
                  AppColors.whiteColor,size: 30,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width*0.01,vertical: height*0.01),
                  margin: EdgeInsets.symmetric(horizontal: width*0.02),
                  decoration: BoxDecoration(
                      color: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.transparentColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: themeProvider.isDarkMode()? AppColors.transparentColor:
                          AppColors.whiteColor,
                          width: 2
                      )
                  ),
                  child: Text(languageProvider.appLanguage.toUpperCase(),style: AppStyles.semi14White,),
                )
                  ],
                ),
              ],

            ),

                DefaultTabController(length: eventListProvider.eventsNameList.length,
                    child: TabBar(
                      onTap: (index){
                      eventListProvider.changeSelectedIndex(index);
                      },
                        isScrollable: true,
                        dividerColor: AppColors.transparentColor,
                        indicatorColor: AppColors.transparentColor,
                        labelPadding: EdgeInsets.symmetric(horizontal: width*0.02),
                        tabAlignment: TabAlignment.start,
                        tabs: eventListProvider.eventsNameList.map((eventName){
                      return TabWidget(eventName: eventName, isSelected: eventListProvider.selectedIndex==eventListProvider.eventsNameList.indexOf(eventName),
                        selectedColor: themeProvider.isDarkMode()?AppColors.mainDarkColor: AppColors.whiteColor,
                        unselectedColor:AppColors.transparentColor,selectedBorderColor: AppColors.transparentColor,
                        unselectedBorderColor: themeProvider.isDarkMode()?AppColors.mainColor:AppColors.whiteColor,selectedTextStyle: Theme.of(context)!.textTheme.labelLarge,unselectedTextStyle: AppStyles.medium16White,);
                    }).toList()
                    )
                )

          ]

        ),

      ),
        body: Consumer<EventListProvider>(
    builder: (context, provider, _) {
      return provider.filterList.isEmpty
          ? Center(child: Text('No events Found', style: Theme.of(context).textTheme.headlineMedium))
          : ListView.separated(
        padding: EdgeInsets.symmetric(vertical: height*0.02),
        itemBuilder: (context, index) {
          final event = provider.filterList[index];
          return EventItem(event: event);
        },
        separatorBuilder: (context, index) => SizedBox(height: height*0.02),
        itemCount: provider.filterList.length,
      );
    },
    ),


    );
  }
}
