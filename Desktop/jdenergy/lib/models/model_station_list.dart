import 'package:json_annotation/json_annotation.dart';
import "model_station.dart";
part 'model_station_list.g.dart';

@JsonSerializable()
class Model_station_list {
    Model_station_list();

    String message;
    String code;
    List<Model_station> data;
    
    factory Model_station_list.fromJson(Map<String,dynamic> json) => _$Model_station_listFromJson(json);
    Map<String, dynamic> toJson() => _$Model_station_listToJson(this);
}
