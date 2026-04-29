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
}
