// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_home _$Model_homeFromJson(Map<String, dynamic> json) {
  return Model_home()
    ..remainingBattery = json['remainingBattery'] as num
    ..power_DC = json['power_DC'] as num
    ..eLinkOnlineCount = json['eLinkOnlineCount'] as num
    ..eLinkTotalCount = json['eLinkTotalCount'] as num
    ..cumulativeDischargeAmount = json['cumulativeDischargeAmount'] as num
    ..eNodeOnlineCount = json['eNodeOnlineCount'] as num
    ..designCapacity = json['designCapacity'] as num
    ..maxPower = json['maxPower'] as num
    ..cumulativeIncome = json['cumulativeIncome'] as num
    ..dischargeAmount = json['dischargeAmount'] as num
    ..eNodeTotalCount = json['eNodeTotalCount'] as num
    ..todayInCome = json['todayInCome'] as num;
}

Map<String, dynamic> _$Model_homeToJson(Model_home instance) =>
    <String, dynamic>{
      'remainingBattery': instance.remainingBattery,
      'power_DC': instance.power_DC,
      'eLinkOnlineCount': instance.eLinkOnlineCount,
      'eLinkTotalCount': instance.eLinkTotalCount,
      'cumulativeDischargeAmount': instance.cumulativeDischargeAmount,
      'eNodeOnlineCount': instance.eNodeOnlineCount,
      'designCapacity': instance.designCapacity,
      'maxPower': instance.maxPower,
      'cumulativeIncome': instance.cumulativeIncome,
      'dischargeAmount': instance.dischargeAmount,
      'eNodeTotalCount': instance.eNodeTotalCount,
      'todayInCome': instance.todayInCome
    };
