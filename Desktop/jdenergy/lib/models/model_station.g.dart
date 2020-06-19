// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_station _$Model_stationFromJson(Map<String, dynamic> json) {
  return Model_station()
    ..id = json['id'] as num
    ..timePriceId = json['timePriceId'] as num
    ..strategyId = json['strategyId'] as num
    ..name = json['name'] as String
    ..address = json['address'] as String
    ..longitude = json['longitude'] as num
    ..latitude = json['latitude'] as num
    ..afterSalesCall = json['afterSalesCall'] as String
    ..description = json['description'] as String
    ..maxPower = json['maxPower'] as num
    ..capacity = json['capacity'] as num
    ..commissioningTime = json['commissioningTime'] as String
    ..power = json['power'] as num
    ..remainingBattery = json['remainingBattery'] as num
    ..soc = json['soc'] as num
    ..equipmentTotalCount = json['equipmentTotalCount'] as num
    ..onlineEquipmentCount = json['onlineEquipmentCount'] as num
    ..operationHours = json['operationHours'] as num
    ..type = json['type'] as String
    ..version = json['version'] as String
    ..number = json['num'] as int;
}

Map<String, dynamic> _$Model_stationToJson(Model_station instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timePriceId': instance.timePriceId,
      'strategyId': instance.strategyId,
      'name': instance.name,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'afterSalesCall': instance.afterSalesCall,
      'description': instance.description,
      'maxPower': instance.maxPower,
      'capacity': instance.capacity,
      'commissioningTime': instance.commissioningTime,
      'power': instance.power,
      'remainingBattery': instance.remainingBattery,
      'soc': instance.soc,
      'equipmentTotalCount': instance.equipmentTotalCount,
      'onlineEquipmentCount': instance.onlineEquipmentCount,
      'operationHours': instance.operationHours,
      'type': instance.type,
      'version': instance.version,
      'num': instance.number
    };
