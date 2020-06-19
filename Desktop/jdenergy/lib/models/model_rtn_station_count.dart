import 'package:json_annotation/json_annotation.dart';
import "model_station_count.dart";
part 'model_rtn_station_count.g.dart';

@JsonSerializable()
class Model_rtn_station_count {
    Model_rtn_station_count();

    String message;
    String code;
    Model_station_count data;
    
    factory Model_rtn_station_count.fromJson(Map<String,dynamic> json) => _$Model_rtn_station_countFromJson(json);
    Map<String, dynamic> toJson() => _$Model_rtn_station_countToJson(this);
}
