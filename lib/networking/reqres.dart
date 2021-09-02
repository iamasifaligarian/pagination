import 'package:json_annotation/json_annotation.dart';

part 'reqres.g.dart';

@JsonSerializable(explicitToJson: true)
class Reqres {
  late int page;
  late int per_page;
  late int total;
  late int total_pages;
  List<UserData>? data;

  Reqres(this.page, this.per_page, this.total, this.total_pages, this.data);

  factory Reqres.fromJson(Map<String, dynamic> json) => _$ReqresFromJson(json);

  Map<String, dynamic> toJson() => _$ReqresToJson(this);
}

@JsonSerializable()
class UserData {
  late int id;
  late String email;
  late String first_name;
  late String last_name;
  late String avatar;

  UserData(this.id, this.email, this.first_name, this.last_name, this.avatar);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
