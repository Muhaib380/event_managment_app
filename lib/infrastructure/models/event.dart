// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

class EventModel {
  final String? docId;
  final String? title;
  final String? location;
  final String? eventdetails;
  final String? image;
  bool isFavorite; // ✅ final hata diya taake UI mein toggle ho sake
  final int? createAt;
  final DateTime? dateTime;

  EventModel({
    this.docId,
    this.title,
    this.location,
    this.eventdetails,
    this.image,
    this.isFavorite = false,
    this.createAt,
    this.dateTime,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    docId: json["docId"],
    title: json["title"],
    location: json["location"],
    eventdetails: json["eventdetails"],
    image: json["image"],
    isFavorite: json["isFavorite"] ?? false,
    createAt: json["createAt"],
    dateTime: json["dateTime"] != null
        ? DateTime.fromMillisecondsSinceEpoch(json["dateTime"])
        : null,
  );

  Map<String, dynamic> toJson(String eventId) => {
    "docId": eventId,
    "title": title,
    "location": location,
    "eventdetails": eventdetails,
    "image": image,
    "isFavorite": isFavorite,
    "createAt": createAt,
    "dateTime": dateTime?.millisecondsSinceEpoch,
  };
}
