// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..name = json['name'] as String
    ..user_type = json['user_type'] as String
    ..login = json['login'] as String
    ..password = json['password'] as String
    ..company = json['company'] as String
    ..weiixn = json['weiixn'] as String
    ..tel = json['tel'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'user_type': instance.user_type,
      'login': instance.login,
      'password': instance.password,
      'company': instance.company,
      'weiixn': instance.weiixn,
      'tel': instance.tel
    };
