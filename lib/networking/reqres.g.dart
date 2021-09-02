// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reqres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reqres _$ReqresFromJson(Map<String, dynamic> json) {
  return Reqres(
    json['page'] as int,
    json['per_page'] as int,
    json['total'] as int,
    json['total_pages'] as int,
    (json['data'] as List<dynamic>?)
        ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ReqresToJson(Reqres instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    json['id'] as int,
    json['email'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
    };
