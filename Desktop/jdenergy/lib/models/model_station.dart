import 'package:json_annotation/json_annotation.dart';

part 'model_station.g.dart';

@JsonSerializable()
class Model_station {
    Model_station();

    num id;
    num timePriceId;
    num strategyId;
    String name;
    String address;
    num longitude;
    num latitude;
    String afterSalesCall;
    String description;
    num maxPower;
    num capacity;
    String commissioningTime;
    num power;
    num remainingBattery;
    num soc;
    num equipmentTotalCount;
    num onlineEquipmentCount;
    num operationHours;
    String type;
    String version;
    @JsonKey(name: 'num') int number;
    
    factory Model_station.fromJson(Map<String,dynamic> json) => _$Model_stationFromJson(json);
    Map<String, dynamic> toJson() => _$Model_stationToJson(this);
}
