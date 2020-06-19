// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_rtn_alarm_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_rtn_alarm_count _$Model_rtn_alarm_countFromJson(
    Map<String, dynamic> json) {
  return Model_rtn_alarm_count()
    ..message = json['message'] as String
    ..code = json['code'] as String
    ..data = json['data'] == null
        ? null
        : Model_alarm_count.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Model_rtn_alarm_countToJson(
        Model_rtn_alarm_count instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data
    };
