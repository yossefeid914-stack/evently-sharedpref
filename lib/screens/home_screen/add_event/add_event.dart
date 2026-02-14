import 'package:evently/firebase_utils.dart';
import 'package:evently/model/event.dart';
import 'package:evently/screens/home_screen/add_event/date_or_time_widget.dart';
import 'package:evently/screens/profile_tab/home/widget/custom_elevated_button.dart';
import 'package:evently/screens/profile_tab/home/widget/custom_text_field.dart';
import 'package:evently/screens/profile_tab/home/widget/tab_widget.dart';
import 'package:evently/screens/provider/event_list_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/app_routes.dart';
import '../../provider/app_theme_provider.dart';

class AddEvent extends StatefulWidget {
  Event?event;
   AddEvent({super.key,this.event});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

List<String>eventsNameList=[];
List<String>eventsImagesLightList=[
  AppAssets.lightSport,
  AppAssets.lightMeeting,
  AppAssets.lightMeeting,
  AppAssets.lightBookClub,
  AppAssets.lightBookClub,
  AppAssets.lightBookClub,
  AppAssets.lightBookClub,
  AppAssets.lightBookClub,
  AppAssets.lightBookClub,

];
List<String>eventsImagesDarkList=[
  AppAssets.darkMeeting,
  AppAssets.darkMeeting,
  AppAssets.darkMeeting,
  AppAssets.darkBookClub,
  AppAssets.darkBookClub,
  AppAssets.darkBookClub,
  AppAssets.darkBookClub,
  AppAssets.darkBookClub,
  AppAssets.darkBookClub,
];
int selectedIndex=0;
String title='';

String description='';
var formKey=GlobalKey<FormState>();
DateTime?selectedDate;
String formatDate='';
TimeOfDay? selectedTime;
String formatTime='';
String eventName='';
String eventImage='';
late EventListProvider eventListProvider;
bool isEdit = false;
late TextEditingController titleController;
late TextEditingController descriptionController;
  @override
  @override
  void initState() {
    super.initState();

    titleController = TextEditingController();
    descriptionController = TextEditingController();

    if (widget.event != null) {
      isEdit = true;

      title = widget.event!.eventTitle;
      description = widget.event!.eventDescription;
      selectedDate = widget.event!.eventDate;
      formatDate = DateFormat('MMM d, y').format(selectedDate!);
      formatTime = widget.event!.eventTime;
      eventName = widget.event!.eventName;
      eventImage = widget.event!.eventImage;

      titleController.text = title;
      descriptionController.text = description;
    }
  }
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
     eventListProvider=Provider.of<EventListProvider>(context);
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    eventsNameList=[
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    eventName=eventsNameList[selectedIndex];
    eventImage=themeProvider.isDarkMode()?eventsImagesDarkList[selectedIndex]:
    eventsImagesLightList[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: width*0.18,
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
        iconTheme: IconThemeData(
          color: themeProvider.isDarkMode()?AppColors.whiteColor:AppColors.mainColor
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparentColor,
        title: Text('Add Event',style: Theme.of(context).textTheme.labelSmall,),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: height*0.02,
              children: [
               Container(
                 clipBehavior: Clip.antiAlias,
                 decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16),
                   border: Border.all(
                     color: themeProvider.isDarkMode()?AppColors.transparentColor:
                     AppColors.strokeColor,
                     width: 2
                   )
                 ),
                 child: Image.asset(
                   fit: BoxFit.fill,
                   eventImage
                    ),
               ),
                SizedBox(height: height*0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          selectedIndex=index;
                          setState(() {
            
                          });
                        },
                        child: TabWidget(eventName:eventsNameList[index], isSelected: selectedIndex==index,
                          selectedColor: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.mainColor,
                          unselectedColor:  themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
                        selectedBorderColor: AppColors.transparentColor,
                        unselectedBorderColor: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.strokeColor,
                        selectedTextStyle: AppStyles.medium16White,unselectedTextStyle: Theme.of(context).textTheme.headlineSmall,),
                      );
                    },
                    separatorBuilder: (context,index){
                      return SizedBox(width: width*0.02,);
                    },
                    itemCount: eventsNameList.length),
                ),
                 Text(
                  isEdit ? 'Edit Event' : 'Add Event',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                CustomTextField(

                    controller: titleController,
                    onChanged: (value) => title = value,
                  // onChanged: (newValue){
                  //   title=newValue;
                  // },
                  validator: (text){
                    if(text==null || text.trim().isEmpty){
                      return 'Please Enter Event Title';
                    }
                    return null;
                  },
                  hintText: 'event title',
                  filled: themeProvider.isDarkMode()?false:true,
                  fillColor: themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
                  borderSideColor:
                themeProvider.isDarkMode()?AppColors.mainColor:
                AppColors.strokeColor,
                  hintStyle: Theme.of(context).textTheme.headlineSmall,
                ), Text('Description',style: Theme.of(context).textTheme.labelSmall,),
                CustomTextField(
                  controller: descriptionController,
                  onChanged: (newValue){
                    description=newValue;
                  },
                  validator: (text){
                    if(text==null|| text.trim().isEmpty){
                      return 'Please Enter Event Description';
                    }
                    return null;
                  },
                  maxLines: 5,
                  hintText: 'Description',
                  filled: themeProvider.isDarkMode()?false:true,
                  fillColor: themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
                  borderSideColor:
                themeProvider.isDarkMode()?AppColors.mainColor:
                AppColors.strokeColor,
                  hintStyle: Theme.of(context).textTheme.headlineSmall,
                ),
                DateOrTimeWidget(iconDateOrTime: Icon(Icons.date_range_outlined,color: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.mainColor,),
                    dateOrTimeText:'event date' ,
                    chooseDateOrTime: selectedDate ==null? 'choose date':formatDate,
                    onChooseDateOrTime: onChooseDate) ,
                DateOrTimeWidget(iconDateOrTime: Icon(Icons.timer_outlined,color: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.mainColor,),
                    dateOrTimeText:'event time' ,
                    chooseDateOrTime: selectedTime ==null? 'choose time':formatTime,
                    onChooseDateOrTime: onChooseTime),
              CustomElevatedButton(
                onPressed: isEdit ? updateEvent : addEvent,
                child: Text(
                  isEdit ? 'Update Event' : 'Add Event',
                  style: AppStyles.medium20White,
                ),
                  backgroundColor: themeProvider.isDarkMode()?AppColors.mainDarkColor:AppColors.mainColor,),
                SizedBox(height: height*0.06,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onChooseDate()async{
var chooseDate=await showDatePicker(
  initialDate: DateTime.now(),
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 365)));
selectedDate=chooseDate;
if(selectedDate!=null) {
  formatDate = DateFormat('MMM d, y').format(selectedDate!);
}
setState(() {

});
  }

  void onChooseTime()async{

 var chooseTime=await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
    selectedTime=chooseTime;
    if(selectedTime!=null){
      formatTime=selectedTime!.format(context);
    }
    setState(() {
    });
  }

void addEvent(){
if(formKey.currentState?.validate()==true){
  Event event=Event(
      eventName: eventName,
      eventImage: eventImage,
      eventTitle: title,
      eventDescription: description,
      eventDate: selectedDate!,
      eventTime: formatTime);
FirebaseUtils.addToFireStore(event).
timeout(Duration(seconds: 1),
    onTimeout: (){
eventListProvider.getAllEventsFromFireStore();
  print('Events added successfully');
  Navigator.pop(context);
});

}
}
void updateEvent() {
  if (formKey.currentState?.validate() == true) {
    widget.event!
      ..eventTitle = title
      ..eventDescription = description
      ..eventDate = selectedDate!
      ..eventTime = formatTime
      ..eventName = eventName
      ..eventImage = eventImage;

    FirebaseUtils.updateEvent(widget.event!).then((_) {
      eventListProvider.getAllEventsFromFireStore();
      Navigator.pop(context);
    });
  }
}
}
