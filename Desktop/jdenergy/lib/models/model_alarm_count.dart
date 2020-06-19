import 'package:json_annotation/json_annotation.dart';

part 'model_alarm_count.g.dart';

@JsonSerializable()
class Model_alarm_count {
    Model_alarm_count();

    num grade3;
    num grade2;
    num grade1;
    
    factory Model_alarm_count.fromJson(Map<String,dynamic> json) => _$Model_alarm_countFromJson(json);
    Map<String, dynamic> toJson() => _$Model_alarm_countToJson(this);
}
