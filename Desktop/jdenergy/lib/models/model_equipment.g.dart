// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_equipment _$Model_equipmentFromJson(Map<String, dynamic> json) {
  return Model_equipment()
    ..id = json['id'] as num
    ..stationId = json['stationId'] as num
    ..name = json['name'] as String
    ..parentEquipmentId = json['parentEquipmentId'] as num
    ..typeId = json['typeId'] as num
    ..status = json['status'] as String
    ..typeName = json['typeName'] as String
    ..parentEquipmentName = json['parentEquipmentName'] as String
    ..parentNumbering = json['parentNumbering'] as String
    ..numbering = json['numbering'] as String
    ..cellCount = json['cellCount'] as num
    ..temperatureSensorCount = json['temperatureSensorCount'] as num
    ..capacity = json['capacity'] as num
    ..maxPower = json['maxPower'] as num
    ..numid = json['num'] as int;
}

Map<String, dynamic> _$Model_equipmentToJson(Model_equipment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stationId': instance.stationId,
      'name': instance.name,
      'parentEquipmentId': instance.parentEquipmentId,
      'typeId': instance.typeId,
      'status': instance.status,
      'typeName': instance.typeName,
      'parentEquipmentName': instance.parentEquipmentName,
      'parentNumbering': instance.parentNumbering,
      'numbering': instance.numbering,
      'cellCount': instance.cellCount,
      'temperatureSensorCount': instance.temperatureSensorCount,
      'capacity': instance.capacity,
      'maxPower': instance.maxPower,
      'num': instance.numid
    };
