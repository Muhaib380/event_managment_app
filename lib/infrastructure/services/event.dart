import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';

class EventServices {
  String eventCollection = "EventCollection";

  ///create event
  Future createEvent(EventModel model) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection(eventCollection)
        .doc();
    return await FirebaseFirestore.instance
        .collection(eventCollection)
        .doc(docRef.id)
        .set((model.toJson(docRef.id)));
  }

  ///get event
  Stream<List<EventModel>> getEvent() {
    return FirebaseFirestore.instance
        .collection(eventCollection)
        .snapshots()
        .map(
          (list) => list.docs
              .map((eventJson) => EventModel.fromJson(eventJson.data()))
              .toList(),
        );
  }

  /// update event
  Future updateEvent(EventModel model) async {
    return await FirebaseFirestore.instance
        .collection(eventCollection)
        .doc(model.docId)
        .update({
          'title': model.title,
          'date': model.dateTime,
          'time': model.dateTime,
          'location': model.location,
          'eventdetails': model.eventdetails,
          'image': model.image,
        });
  }

  ///delte event
  Future deleteEvent(String eventId) async {
    return await FirebaseFirestore.instance
        .collection(eventCollection)
        .doc(eventId)
        .delete();
  }

  ///get favorite events
  Stream<List<EventModel>> getFavoriteEvents() {
    return FirebaseFirestore.instance
        .collection(eventCollection)
        .where("isFavorite", isEqualTo: true)
        .snapshots()
        .map(
          (list) => list.docs
              .map((eventJson) => EventModel.fromJson(eventJson.data()))
              .toList(),
        );
  }

  ///toggle favorite status
  Future toggleFavorite(String eventId, bool isFavorite) async {
    return await FirebaseFirestore.instance
        .collection(eventCollection)
        .doc(eventId)
        .update({'isFavorite': isFavorite});
  }
}
