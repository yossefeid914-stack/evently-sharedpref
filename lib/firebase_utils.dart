import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollection(){
   return FirebaseFirestore.instance.collection(Event.collectionName).withConverter<Event>(
      fromFirestore:(snapshot, _) => Event.fromFireStore(snapshot.data()!),
      toFirestore: (event, options) => event.toFireStore(),);
  }
  static Future<void> addToFireStore(Event event){
             CollectionReference<Event>  collectionRef=getEventsCollection();
            DocumentReference <Event> docRef= collectionRef.doc();
         event.id= docRef.id;
       return docRef.set(event);
       // FirebaseFirestore.instance.collection(Event.collectionName).withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore).doc().set(event);

  }
  static Future<void> updateEvent(Event event) async {
    var collection = getEventsCollection();
    await collection.doc(event.id).update(event.toFireStore());
  }
  static Future<void> deleteEvent(String eventId) async {
    // var collection = getEventsCollection();
    return getEventsCollection().doc(eventId).delete();
  }
}