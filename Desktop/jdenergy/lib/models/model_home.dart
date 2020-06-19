import 'package:json_annotation/json_annotation.dart';

part 'model_home.g.dart';

@JsonSerializable()
class Model_home {
    Model_home();

    num remainingBattery;
    num power_DC;
    num eLinkOnlineCount;
    num eLinkTotalCount;
    num cumulativeDischargeAmount;
    num eNodeOnlineCount;
    num designCapacity;
    num maxPower;
    num cumulativeIncome;
    num dischargeAmount;
    num eNodeTotalCount;
    num todayInCome;
    
    factory Model_home.fromJson(Map<String,dynamic> json) => _$Model_homeFromJson(json);
    Map<String, dynamic> toJson() => _$Model_homeToJson(this);
}
