import 'package:json_annotation/json_annotation.dart';

part 'model_station_count.g.dart';

@JsonSerializable()
class Model_station_count {
    Model_station_count();

    num onlineCount;
    num totalCount;
    
    factory Model_station_count.fromJson(Map<String,dynamic> json) => _$Model_station_countFromJson(json);
    Map<String, dynamic> toJson() => _$Model_station_countToJson(this);
}
