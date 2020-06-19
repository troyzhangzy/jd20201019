import 'package:json_annotation/json_annotation.dart';
import "model_equipment.dart";
part 'model_equipment_list.g.dart';

@JsonSerializable()
class Model_equipment_list {
    Model_equipment_list();

    String message;
    String code;
    List<Model_equipment> data;
    
    factory Model_equipment_list.fromJson(Map<String,dynamic> json) => _$Model_equipment_listFromJson(json);
    Map<String, dynamic> toJson() => _$Model_equipment_listToJson(this);
}
