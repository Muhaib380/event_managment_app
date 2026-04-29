// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';


class EventModel {
    final String? docId;
    final String? title;
    final String? date;
    final String? time;
    final String? location;
    final String? eventdetails;
    final String? image;
    final int? createAt;

    EventModel({
        this.docId,
        this.title,
        this.date,
        this.time,
        this.location,
        this.eventdetails,
        this.image,
        this.createAt,
    });

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        docId: json["docId"],
        title: json["title"],
        date: json["date"],
        time: json["time"],
        location: json["location"],
        eventdetails: json["eventdetails"],
        image: json["image"],
        createAt: json["createAt"],
    );

    Map<String, dynamic> toJson() => {
        "docId": docId,
        "title": title,
        "date": date,
        "time": time,
        "location": location,
        "eventdetails": eventdetails,
        "image": image,
        "createAt": createAt,
    };
}
