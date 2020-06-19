// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_equipment_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_equipment_list _$Model_equipment_listFromJson(Map<String, dynamic> json) {
  return Model_equipment_list()
    ..message = json['message'] as String
    ..code = json['code'] as String
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : Model_equipment.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Model_equipment_listToJson(
        Model_equipment_list instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data
    };
