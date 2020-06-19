import 'package:json_annotation/json_annotation.dart';
import "model_equipment.dart";
part 'model_search_equipment.g.dart';

@JsonSerializable()
class Model_search_equipment {
    Model_search_equipment();

    num draw;
    num recordsTotal;
    num recordsFiltered;
    List<Model_equipment> data;
    
    factory Model_search_equipment.fromJson(Map<String,dynamic> json) => _$Model_search_equipmentFromJson(json);
    Map<String, dynamic> toJson() => _$Model_search_equipmentToJson(this);
}
