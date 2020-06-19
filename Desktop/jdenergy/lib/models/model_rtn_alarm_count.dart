import 'package:json_annotation/json_annotation.dart';
import "model_alarm_count.dart";
part 'model_rtn_alarm_count.g.dart';

@JsonSerializable()
class Model_rtn_alarm_count {
    Model_rtn_alarm_count();

    String message;
    String code;
    Model_alarm_count data;
    
    factory Model_rtn_alarm_count.fromJson(Map<String,dynamic> json) => _$Model_rtn_alarm_countFromJson(json);
    Map<String, dynamic> toJson() => _$Model_rtn_alarm_countToJson(this);
}
