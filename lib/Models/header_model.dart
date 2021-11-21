// To parse this JSON data, do
//
// final onBoardUserModel = onBoardUserModelFromJson(jsonString);

import 'dart:convert';

HeaderModel onBoardUserModelFromJson(String str) =>
    HeaderModel.fromJson(json.decode(str));

String onBoardUserModelToJson(HeaderModel data) => json.encode(data.toJson());

class HeaderModel {
  String? authorization;

  HeaderModel({
    required this.authorization,
  });

  factory HeaderModel.fromJson(Map<String, dynamic> json) => HeaderModel(
        authorization:
            // ignore: prefer_if_null_operators
            json["Authorization"] == null ? null : json["Authorization"],
      );

  Map<String, dynamic> toJson() => {
        // ignore: prefer_if_null_operators
        "Authorization": authorization == null ? null : authorization,
      };
  Map<String, String> toHeader() => {
        "Authorization": authorization ?? " ",
      };
}
