
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import '../models/model_rtn_alarm_count.dart';

///能量块页面
class EBlockPage extends StatefulWidget{
  EBlockPage({Key key, this.title, this.station_id, this.eBlock_id}) : super(key: key);

  final String title;
  final int station_id;
  final int eBlock_id;

  @override
  _EBlockPageState createState() => _EBlockPageState();
}

class _EBlockPageState extends State<EBlockPage> {
  num grade1=0;
  num grade2=0;
  num grade3=0;

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    print('------------------_EBlockPageState didChangeDependencies');
    var api =  EmindApi();
    var t0 = DateTime.parse("2020-01-01");
    var t1 = DateTime.now();
    var d = await api.get_data_alarm_count( widget.station_id, widget.eBlock_id);
//    var d2 = await api.get_data_stationlist();
//    var d3 = await api.get_data_stationcount();
    //var d2 = await api.get_data_equipment_list(widget.station_id);
    print('--------await api.get_data_home d:$d');
    //print('--------await api.get_data_equipment_list d2:$d2');
//    print('--------await api.get_data_stationcount d2:$d3');
    if(d != null /*|| d2 != null || d3 != null*/){
      setState(() {
        if(d != null) {
          var data = d.data;

          grade1 = data?.grade1??0;
          grade2 = data?.grade2??0;
          grade3 = data?.grade3??0;
//          dischargeAmount = d.dischargeAmount ?? 0;
//          cumulativeDischargeAmount = d.cumulativeDischargeAmount ?? 0;
//          eNodeTotalCount = d.eNodeTotalCount ?? 0;
//          eNodeOnlineCount = d.eNodeOnlineCount ?? 0;
//          todayInCome = d.todayInCome?.toDouble()??0.0;
//          cumulativeIncome = d.cumulativeIncome?.toDouble() ?? 0.0;
//          remainingBattery = d.remainingBattery?.toDouble() ?? 0.0;
//          power_DC  = d.power_DC?.toDouble() ?? 0.0;
        }
        //if(d2 != null){
//          stationNums = d2.data.length;
//          equipment_list = d2.data;
//          print("equipment_list:$equipment_list");
//          init_eblocks(equipment_list?.length??0);
        //}
//
//        if(d3 != null){
//          onlineStationNums = d3.data.onlineCount??0;
//        }
      });
    }
    print('----------------------_EBlockPageState leave didChangeDependencies');
  }

  Widget buildPowerCard(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 8, 5, 15),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xff0154a4),width: 1),
                            borderRadius: BorderRadius.circular(42)
                        ),
                        child:  Icon(
                          Icons.flash_on,
                          color: Color(0xff0154a4),
                          size: 24.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("实时功率",
                              style: TextStyle(fontSize: 14.0,color: Colors.black,)
                          ),
                          Text("52.98kWh",
                              style: TextStyle(fontSize: 12.0,color: Colors.black,)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 10,
                    maxWidth: 30,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xff0154a4),width: 1),
                            borderRadius: BorderRadius.circular(42)
                        ),
                        child:  Icon(
                          Icons.battery_unknown,
                          color: Color(0xff0154a4),
                          size: 24.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            //width: 30,
                            child:Text("剩余电量",
                                maxLines: 1,
                                style: TextStyle(fontSize: 14.0,color: Colors.black,)
                            ),
                          ),
                          Text("456KWh",
                              style: TextStyle(fontSize: 12.0,color: Colors.black,)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          )
      ),
    );
  }

  //构建警报内容
  Widget buildAlarmContent(BuildContext context, int level) {
    num grade=0;
    switch (level) {
      case 1 : {
        grade = grade1;
      }
      break;
      case 2: {
        grade = grade2;
      }
      break;
      case 3: {
        grade = grade3;
      }
    }

    return grade>0 ?
      Text("$grade",
          style: TextStyle(
          fontSize: 14.0,
          color: Colors.red,
          ),
          textAlign: TextAlign.center,
        )
       : Icon(Icons.brightness_1, color: Colors.grey,size: 20,);
  }

  String _satisticByDay = '''
    {
      title:{
        show: false,
        text: '日报表',
      },
      color: ['#37A2DA', '#32C4E9', '#9FE7B9', '#FEDA5B', '#FE9F7E', '#FB7192', '#E7BCF2', '#8278E9'],
      legend: {
        data: ['充电尖值', '充电峰值', '充电平值', '充电谷值', '放电尖值', '放电峰值', '放电平值', '放电谷值']

      },
      grid: {
        left: 40
      },
      
      
      padding: 10,
      xAxis: {
        
        type: 'category',
        data: ['1', '2', '3', '4', '5', '6', '7','8', '9', '10', '11', '12', '13', '14','15','16', '17', '18', '19', '20', '21', '22','23', '24', '25', '26', '27', '28', '29','30']
      },
      yAxis: {
        type: 'value'
      },
      series: [
              {
              name: '充电尖值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820]
              },
              {
              name: '充电峰值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820]
              },
              {
              name: '充电平值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820]
              },
              {
              name: '充电谷值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820]
              },

              {
              name: '放电尖值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820]
              },
              {
              name: '放电峰值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820]
              },
              {
              name: '放电平值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820]
              },
              {
              name: '放电谷值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820]
              },
        ]
    }
  ''';
  Widget buildPowerStatisticWidget(BuildContext context, String optionString, String title) {


    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child:Text(title, style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
          ),
          Container(

            margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
            child: Card(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),  //设置圆角
              child: Container(
                padding: EdgeInsets.all(5),
                child: Echarts(
                  option: optionString,
                ),
              ),

            ),
            width: 340,
            height: 300,
          ),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fb),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        //itemExtent: 330,
        shrinkWrap: true,
        children: <Widget>[
          buildPowerCard(context),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 125,
              minWidth: double.infinity,
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 12),
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Column(
                        children: <Widget>[
                          Table(
                            border: TableBorder.all(
                              color: Colors.grey,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,

                            children: [
                              TableRow(
                                  children: [
                                    Container(
                                      height: 30,
                                      alignment: AlignmentDirectional.center,
                                      child: Text("PCS状态"),
                                    ),
                                    Text("待机",style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),textAlign: TextAlign.center,),
                                    Container(
                                      height: 30,
                                      alignment: AlignmentDirectional.center,
                                      child: Text("绝缘抗体"),
                                    ),
                                    Text("正常",style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),textAlign: TextAlign.center,),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Container(
                                      height: 30,
                                      alignment: AlignmentDirectional.center,
                                      child: Text("直流电压"),
                                    ),
                                    Text("256V",style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),textAlign: TextAlign.center,),
                                    Container(
                                      height: 30,
                                      alignment: AlignmentDirectional.center,
                                      child: Text("直流电流"),
                                    ),
                                    Text("10A",style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),textAlign: TextAlign.center,),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Container(
                                      height: 50,
                                      alignment: AlignmentDirectional.center,
                                      child: Text("电池单体\n最高电压"),
                                    ),
                                    Text("3.451V",style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),textAlign: TextAlign.center,),
                                    Container(
                                      height: 50,
                                      alignment: AlignmentDirectional.center,
                                      child: Text("电池单体\n最高温度"),
                                    ),
                                    Text("34°C",style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),textAlign: TextAlign.center,),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Container(
                                      height: 50,
                                      alignment: AlignmentDirectional.center,
                                      child: Text("电池单体\n最低电压"),
                                    ),
                                    Text("3.345V",style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),textAlign: TextAlign.center,),
                                    Container(
                                      height: 50,
                                      alignment: AlignmentDirectional.center,
                                      child: Text("电池单体\n最低温度"),
                                    ),
                                    Text("24°C",style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),textAlign: TextAlign.center,),
                                  ]
                              ),
                            ],

                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child: Table(
                              border: TableBorder.all(
                                color: Colors.grey,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                    children: [
                                      Container(
                                        height: 50,
                                        alignment: AlignmentDirectional.center,
                                        child: Text("一级\n警告",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      buildAlarmContent(context, 1),
                                      Text("二级\n警告",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,),
                                      buildAlarmContent(context, 2),
                                      Container(
                                        height: 50,
                                        alignment: AlignmentDirectional.center,
                                        child: Text("三级\n警告"),
                                      ),
                                      buildAlarmContent(context, 3),
                                    ]
                                ),
                              ],

                            ),
                          )
                        ],
                      )
                  )
              ),
            ),
          ),
          buildPowerStatisticWidget(context, _satisticByDay, "日报表"),

        ],
      ),

    );
  }

  /*
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fb),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildPowerCard(context),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                //itemExtent: 330,
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 125,
                        minWidth: double.infinity,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 12),
                        child: Card(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: <Widget>[
                                    Table(
                                      border: TableBorder.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                      ),
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,

                                      children: [
                                        TableRow(
                                            children: [
                                              Container(
                                                height: 30,
                                                alignment: AlignmentDirectional.center,
                                                child: Text("PCS状态"),
                                              ),
                                              Text("待机",style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),textAlign: TextAlign.center,),
                                              Container(
                                                height: 30,
                                                alignment: AlignmentDirectional.center,
                                                child: Text("绝缘抗体"),
                                              ),
                                              Text("正常",style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),textAlign: TextAlign.center,),
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Container(
                                                height: 30,
                                                alignment: AlignmentDirectional.center,
                                                child: Text("直流电压"),
                                              ),
                                              Text("256V",style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),textAlign: TextAlign.center,),
                                              Container(
                                                height: 30,
                                                alignment: AlignmentDirectional.center,
                                                child: Text("直流电流"),
                                              ),
                                              Text("10A",style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),textAlign: TextAlign.center,),
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Container(
                                                height: 50,
                                                alignment: AlignmentDirectional.center,
                                                child: Text("电池单体\n最高电压"),
                                              ),
                                              Text("3.451V",style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),textAlign: TextAlign.center,),
                                              Container(
                                                height: 50,
                                                alignment: AlignmentDirectional.center,
                                                child: Text("电池单体\n最高温度"),
                                              ),
                                              Text("34°C",style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),textAlign: TextAlign.center,),
                                            ]
                                        ),
                                        TableRow(
                                            children: [
                                              Container(
                                                height: 50,
                                                alignment: AlignmentDirectional.center,
                                                child: Text("电池单体\n最低电压"),
                                              ),
                                              Text("3.345V",style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),textAlign: TextAlign.center,),
                                              Container(
                                                height: 50,
                                                alignment: AlignmentDirectional.center,
                                                child: Text("电池单体\n最低温度"),
                                              ),
                                              Text("24°C",style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),textAlign: TextAlign.center,),
                                            ]
                                        ),
                                      ],

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                      child: Table(
                                        border: TableBorder.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                        ),
                                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                        children: [
                                          TableRow(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  alignment: AlignmentDirectional.center,
                                                  child: Text("一级\n警告",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Icon(Icons.brightness_1, color: Colors.red,size: 20,),
                                                Text("二级\n警告",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.center,),
                                                Icon(Icons.brightness_1, color: Colors.grey,size: 20,),
                                                Container(
                                                  height: 50,
                                                  alignment: AlignmentDirectional.center,
                                                  child: Text("三级\n警告"),
                                                ),
                                                Icon(Icons.brightness_1, color: Colors.grey,size: 20,),
                                              ]
                                          ),
                                        ],

                                      ),
                                    )
                                  ],
                                )
                            )
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: buildPowerStatisticWidget(context, _satisticByDay, "日报表"),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
   */
}

