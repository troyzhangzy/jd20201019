// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_search_equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_search_equipment _$Model_search_equipmentFromJson(
    Map<String, dynamic> json) {
  return Model_search_equipment()
    ..draw = json['draw'] as num
    ..recordsTotal = json['recordsTotal'] as num
    ..recordsFiltered = json['recordsFiltered'] as num
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : Model_equipment.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Model_search_equipmentToJson(
        Model_search_equipment instance) =>
    <String, dynamic>{
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'data': instance.data
    };
