

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
class PowerPage extends StatefulWidget{
  PowerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PowerPageState createState() => _PowerPageState();
}

class _PowerPageState extends State<PowerPage> {

  Widget buildPowerCard(BuildContext context) {
    return  Container(
              padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
              child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                  Text("当日充电:4123",
                                      style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                  ),
                                  Text("当日放电:987612",
                                      style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                  ),
                                ],
                              ),
                            ],
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    child:Text("剩余电量",
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                    ),
                                  ),
                                  Text("513KWh",
                                      style: TextStyle(fontSize: 14.0,color: Colors.black,)
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

   String _satisticByMonth = '''
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
        data: ['1', '2', '3', '4', '5', '6', '7','8', '9', '10', '11', '12']
      },
      yAxis: {
        type: 'value'
      },
      series: [
              {
              name: '充电尖值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290]
              },
              {
              name: '充电峰值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290]
              },
              {
              name: '充电平值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290]
              },
              {
              name: '充电谷值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290]
              },

              {
              name: '放电尖值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290]
              },
              {
              name: '放电峰值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290]
              },
              {
              name: '放电平值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290]
              },
              {
              name: '放电谷值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290]
              },
        ]
    }
  ''';

   String _satisticByYear = '''
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
        data: ['2010', '2011', '2012', '2013', '2014', '2015', '2016','2017', '2018', '2019', '2020']
      },
      yAxis: {
        type: 'value'
      },
      series: [
              {
              name: '充电尖值',
              type: 'bar',
              stack: '总量',
             
              data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901,  1290]
              },
              {
              name: '充电峰值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 1290]
              },
              {
              name: '充电平值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 1290]
              },
              {
              name: '充电谷值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934]
              },

              {
              name: '放电尖值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934]
              },
              {
              name: '放电峰值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934]
              },
              {
              name: '放电平值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934]
              },
              {
              name: '放电谷值',
              type: 'bar',
              stack: '总量',
             
               data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934]
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
    return ListView(
        children: <Widget>[
          buildPowerCard(context),
          buildPowerStatisticWidget(context, _satisticByDay, "日报表"),
          buildPowerStatisticWidget(context, _satisticByMonth, "月报表"),
          buildPowerStatisticWidget(context, _satisticByYear, "年报表"),
        ],
   
    );
  }
}

