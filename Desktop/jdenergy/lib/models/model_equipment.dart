import 'package:json_annotation/json_annotation.dart';

part 'model_equipment.g.dart';

@JsonSerializable()
class Model_equipment {
    Model_equipment();

    num id;
    num stationId;
    String name;
    num parentEquipmentId;
    num typeId;
    String status;
    String typeName;
    String parentEquipmentName;
    String parentNumbering;
    String numbering;
    num cellCount;
    num temperatureSensorCount;
    num capacity;
    num maxPower;
    @JsonKey(name: 'num') int numid;
    
    factory Model_equipment.fromJson(Map<String,dynamic> json) => _$Model_equipmentFromJson(json);
    Map<String, dynamic> toJson() => _$Model_equipmentToJson(this);
}
