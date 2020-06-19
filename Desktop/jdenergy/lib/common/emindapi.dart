///访问后台接口
///
///

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'Global.dart';
import '../models/index.dart';

class EmindApi {
  BuildContext context;
  Options _options;
  static Dio dio = Dio(BaseOptions(
//    baseUrl: 'http://j30s029503.wicp.vip:80/',
    baseUrl: 'http://123.57.159.80:8081/',
    connectTimeout: 18000,
    receiveTimeout: 20000,
//    headers: {
//    },
  ));

  EmindApi([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static void init() {
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.access_toke;
  }

  ///登录
  Future<bool> doLogin(String login, String password) async{
    bool brtn = false;
    var parm = "username=$login&password=$password&grant_type=password&scope=all";
    var url = "/emind/auth/oauth/token?$parm";
    print(url);

    Global.access_toke = "Basic Y2xpZW50OnNlY3JldA==";
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.access_toke;

    Response response;

    try{
      print('begin call.....');
      response = await dio.post(url);
      print('response:$response');
      var login = Login.fromJson(response.data);
      print("login model:${login.access_token}");
      print("${login.toString()}");
      var tk = response.data["access_token"];
      if (tk != null){
        Global.access_toke = tk;
        brtn = true;
      }
    }catch(e){
      print('error:$e');
    }

    return brtn;
  }

  //获取收益及电量等数据
  Future<Model_home> get_data_home(DateTime t0, DateTime t1, [int stationId=-1, int equipmentId=-1, int signalId=5]) async {
    var access_token = Global.access_toke;
    var url = "/emind/history/data/home?access_token=$access_token";
    print(url);

    Response response;
    Model_home model;

    try{
      print('begin call.....');
      response = await dio.post(url,
        data:{
          "startTime": t0.toString(),
          "endTime": t1.toString(),
          "stationId": stationId,
          "equipmentId": equipmentId,
          "signalId": signalId,
        }
      );
      print('response:$response');
      //print('reponse.data:${response.data}');
      var json = response.data["data"];
      model = Model_home.fromJson(json);
    }catch(e){
      print('error:$e');
    }
    return model;
  }

  //获取电站列表
  Future<Model_station_list> get_data_stationlist() async {
    var access_token = Global.access_toke;
    var url = "/emind/config/station/list?access_token=$access_token";
    print(url);

    Response response;
    Model_station_list models;

    try{
      response = await dio.get(url);
      print('response:$response');
      models = Model_station_list.fromJson(response.data);
    }catch(e){
      print('error:$e');
    }
    return models;
  }

//获取电站数量
  Future<Model_rtn_station_count> get_data_stationcount() async {
    var access_token = Global.access_toke;
    var url = "/emind/config/station/count?access_token=$access_token";
    print(url);

    Response response;
    Model_rtn_station_count model;

    try{
      response = await dio.get(url);
      print('response:$response');
      model = Model_rtn_station_count.fromJson(response.data);
    }catch(e){
      print('error:$e');
    }
    return model;
  }


//获取能量块列表
  Future<Model_equipment_list> get_data_equipment_list(int stationId) async {
    var access_token = Global.access_toke;
    var url = "/emind/config/equipment/equipments/${stationId}?access_token=$access_token";
    print(url);

    Response response;
    Model_equipment_list model;
    print('--------------------get_data_equipment_list');
    try{
      response = await dio.get(url);
      print('response:$response');
      model = Model_equipment_list.fromJson(response.data);
    }catch(e){
      print('get_data_equipment_list error:$e');
    }
    return model;
  }

  //获取警报数量
  Future<Model_rtn_alarm_count> get_data_alarm_count(int stationId, int equipmentId) async {
    var access_token = Global.access_toke;
    var url = "/emind/alarm/real/get/count/-1/${stationId}/${equipmentId}?access_token=$access_token";
    print(url);

    Response response;
    Model_rtn_alarm_count model;
    print('--------------------get_data_alarm_count');
    try{
      response = await dio.get(url);
      print('get_data_alarm_count response:$response');
      model = Model_rtn_alarm_count.fromJson(response.data);
    }catch(e){
      print('get_data_alarm_count error:$e');
    }
    return model;
  }

  //8.1查询设备
  Future<Model_search_equipment> search_data_equipment_list(int stationId, String name) async {
    var access_token = Global.access_toke;
    var url = "/emind/config/equipment/search?access_token=$access_token";
    print(url);

    Response response;
    Model_search_equipment model;
    print('--------------------search_data_equipment_list');
    try{
        print('begin call.....');
        response = await dio.post(url,
            data:{
              "stationId": stationId,
              "name": name,
              "length": 10000,
              "startIndex": 0,
            }
        );

        print('search_data_equipment_list response:$response');
        model = Model_search_equipment.fromJson(response.data);
    }catch(e){
      print('search_data_equipment_list error:$e');
    }
    return model;
  }

}