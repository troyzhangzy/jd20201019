// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_station_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_station_count _$Model_station_countFromJson(Map<String, dynamic> json) {
  return Model_station_count()
    ..onlineCount = json['onlineCount'] as num
    ..totalCount = json['totalCount'] as num;
}

Map<String, dynamic> _$Model_station_countToJson(
        Model_station_count instance) =>
    <String, dynamic>{
      'onlineCount': instance.onlineCount,
      'totalCount': instance.totalCount
    };
