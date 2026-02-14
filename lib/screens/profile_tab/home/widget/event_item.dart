import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../model/event.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../home_screen/add_event/event_details_screen.dart';
import '../../../provider/app_theme_provider.dart';
import '../../../provider/event_list_provider.dart';

class EventItem extends StatelessWidget {
  final Event event;
  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var eventListProvider = Provider.of<EventListProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EventDetailsScreen(event: event),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.01),
        margin: EdgeInsets.symmetric(horizontal: width*0.04),
        height: height*0.30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: themeProvider.isDarkMode() ? AppColors.transparentColor : AppColors.whiteColor,
          border: Border.all(
              color: themeProvider.isDarkMode() ? AppColors.mainColor : AppColors.strokeColor,
              width: 2
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(event.eventImage),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // التاريخ
            Container(
              padding: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: themeProvider.isDarkMode() ? AppColors.primaryDark : AppColors.whiteBgColor,
                border: Border.all(
                    color: themeProvider.isDarkMode() ? AppColors.mainColor : AppColors.strokeColor,
                    width: 2
                ),
              ),
              child: Text(
                DateFormat('d MMM').format(event.eventDate),
                style: themeProvider.isDarkMode() ? AppStyles.semi16PrimaryDark : AppStyles.semi16Primary,
              ),
            ),
            // العنوان والفافيوريت
            Container(
              padding: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: themeProvider.isDarkMode() ? AppColors.primaryDark : AppColors.whiteBgColor,
                border: Border.all(
                    color: themeProvider.isDarkMode() ? AppColors.mainColor : AppColors.strokeColor,
                    width: 2
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(event.eventTitle, style: Theme.of(context).textTheme.labelMedium),
                  IconButton(
                    onPressed: () {
                      eventListProvider.updateIsFavorite(event);
                    },
                    icon: Icon(
                      event.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}