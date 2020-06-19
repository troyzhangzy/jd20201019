// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_station_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_station_list _$Model_station_listFromJson(Map<String, dynamic> json) {
  return Model_station_list()
    ..message = json['message'] as String
    ..code = json['code'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : Model_station.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Model_station_listToJson(Model_station_list instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data
    };
