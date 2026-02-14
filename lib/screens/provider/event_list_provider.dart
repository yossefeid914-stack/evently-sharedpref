import 'package:flutter/material.dart';

import '../../firebase_utils.dart';
import '../../l10n/app_localizations.dart';
import '../../model/event.dart';

class EventListProvider extends ChangeNotifier{
  List<Event>eventList=[];
List<Event> filterList=[];
List<Event> favoriteList=[];
  int selectedIndex=0;
List<String>eventsNameList=[];

  void getAllEventsFromFireStore()async{
    var querySnapShot=await FirebaseUtils.getEventsCollection().get();
    eventList=querySnapShot.docs.map((doc){
      return doc.data();
    }).toList();
    filterList=eventList;
    filterList.sort((event1, event2) {
      return event1.eventDate.compareTo(event2.eventDate);
    },);
   notifyListeners();
  }
  List<String>getEventsName(BuildContext context){
    return eventsNameList=[
      AppLocalizations.of(context)!.all,
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
  }
  void getFilterEvents()async{
    var querySnapShot=await FirebaseUtils.getEventsCollection().get();
    eventList=querySnapShot.docs.map((doc){
      return doc.data();
    }).toList();
   filterList= eventList.where((event){
      return event.eventName==eventsNameList[selectedIndex];
    }).toList();
    filterList.sort((event1, event2) {
      return event1.eventDate.compareTo(event2.eventDate);
    },);
   notifyListeners();
  }

void changeSelectedIndex(int newSelectedIndex){
    selectedIndex=newSelectedIndex;
    selectedIndex ==0? getAllEventsFromFireStore():getFilterEvents();
}

void updateIsFavorite(Event event){
    FirebaseUtils.getEventsCollection().doc(event.id).update({'is_favorite':!event.isFavorite}).timeout(Duration(seconds: 1),onTimeout: (){
      print('Event updated Successfully');
    });
    selectedIndex ==0? getAllEventsFromFireStore():getFilterEvents();
    getFavoriteEvents();
}
void getFavoriteEvents()async{
   var querySnapshot=await FirebaseUtils.getEventsCollection().where('is_favorite',isEqualTo: true).get();
   favoriteList=querySnapshot.docs.map((doc){
     return doc.data();
   }).toList();
   notifyListeners();
}
}