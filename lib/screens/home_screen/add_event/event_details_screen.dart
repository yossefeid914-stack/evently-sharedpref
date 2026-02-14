import 'package:evently/firebase_utils.dart';
import 'package:evently/model/event.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../utils/app_routes.dart';
import '../../provider/event_list_provider.dart';
import '../../provider/app_theme_provider.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var eventProvider = Provider.of<EventListProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.strokeColor,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start:width*0.04,top: height*0.01,bottom: height*0.01),
          decoration: BoxDecoration(
              color: themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 2,
                  color: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.strokeColor
              )
          ),
          child: IconButton(onPressed: (){Navigator.of(context).pushNamed(AppRoutes.homeRouteName);},icon:Icon(Icons.arrow_back_ios_new_outlined,size: 20),),
        ),
        title: const Text('Event Details'),
        centerTitle: true,
        actions: [
          Container(
      margin: EdgeInsetsDirectional.only(start:width*0.04,top: height*0.01,bottom: height*0.01),
      decoration: BoxDecoration(
          color: themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 2,
              color: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.strokeColor
          )
      ),
      // child: IconButton(onPressed: (){Navigator.of(context).pushNamed(AppRoutes.homeRouteName);},icon:Icon(Icons.arrow_back_ios_new_outlined,size: 20),),

            child: IconButton(
              icon: Icon(Icons.edit, color: AppColors.mainColor),
              onPressed: () {
                // Navigator.of(context).pushNamed(AppRoutes.addEventRouterScreen);
                // ننتقل لصفحة التعديل ونبعت الـ event
                Navigator.of(context).pushNamed( AppRoutes.addEventRouterScreen, arguments: event);
              },
            ),
          ),
          Container(
          margin: EdgeInsetsDirectional.only(start:width*0.04,top: height*0.01,bottom: height*0.01),
    decoration: BoxDecoration(
    color: themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
    width: 2,
    color: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.strokeColor
    )
    ),

            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                FirebaseUtils.deleteEvent(event.id).then((_) {
                  eventProvider.getAllEventsFromFireStore();
                  Navigator.pop(context);
                });
              },
            ),
          ),

        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(event.eventImage, height: height * 0.25, fit: BoxFit.cover),
            ),
            SizedBox(height: height * 0.02),
            Text(event.eventTitle, style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 24)),
            SizedBox(height: height * 0.02),
            // كارد عرض التاريخ والوقت
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.mainColor),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_month, color: AppColors.mainColor),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('d MMMM yyyy').format(event.eventDate)),
                      Text(event.eventTime),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Text('Description', style: Theme.of(context).textTheme.labelSmall),
            SizedBox(height: height * 0.01),
            Text(event.eventDescription, style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}