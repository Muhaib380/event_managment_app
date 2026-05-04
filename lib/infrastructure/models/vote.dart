import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

VoteModel voteModelFromJson(String str) => VoteModel.fromJson(json.decode(str));

String voteModelToJson(VoteModel data) => json.encode(data.toJson());

class VoteModel {
  final String? docId;
  final String? question;
  final List<String>? option;
  final String? image;
  final int? createAt;

  VoteModel({
    this.docId,
    this.question,
    this.option,
    this.image,
    this.createAt,
  });

  factory VoteModel.fromJson(Map<String, dynamic> json) => VoteModel(
    docId: json["docId"],
    question: json["question"],
    option: json["option"] == null
        ? []
        : List<String>.from(json["option"]!.map((x) => x)),
    image: json["image"],
    createAt: json["createdAt"] is Timestamp
        ? (json["createdAt"] as Timestamp).millisecondsSinceEpoch
        : json["createdAt"] as int?,
  );

  Map<String, dynamic> toJson() => {
    "docId": docId,
    "question": question,
    "option": option == null ? [] : List<dynamic>.from(option!.map((x) => x)),
    "image": image,
    "createdAt": createAt,
  };
}
