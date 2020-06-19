//import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';

class SetPage extends StatefulWidget {
  SetPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String _chartsOption = '''
    {
      grid: {
        left: 40
      },
      title:{
        show: true,
        text: '年收益',
      },
      color: ['#fe0000'],
      padding: 10,
      xAxis: {

        type: 'category',
        data: ['0', '1', '2', '3', '4', '5', '6','7', '8', '9', '10', '11', '12', '13', '14', '15', '16','17', '18', '19', '20', '21', '22', '23']
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
            name: 'Step Start',
            type: 'line',
            step: 'true',
            data: [120, 132, 101, 134, 90, 230, 210, 120, 132, 101, 134, 90, 230, 210]
        }
      ]
    }
  ''';

  Widget buildChartsWidget(BuildContext context, String optionString) {
    print("build day");

    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))), //设置圆角
        child: Container(
          padding: EdgeInsets.all(5),
          child: Echarts(
            option: optionString,
          ),
        ),
      ),
      width: 340,
      height: 250,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          buildChartsWidget(context, _chartsOption),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 125,
              minWidth: double.infinity,
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                border: Border.all(
                                    color: Color(0xff0154a4), width: 1),
                                borderRadius: BorderRadius.circular(42)),
                            child: Icon(
                              Icons.flash_on,
                              color: Color(0xff0154a4),
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("当日充电:4123",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  )),
                              Text("当日放电:987612",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("最佳策略"),
                  onPressed: () async {},
                ),
                FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("修改"),
                  onPressed: () async {},
                ),
                FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text("保存"),
                  onPressed: () async {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              //margin: EdgeInsets.fromLTRB(10, 12, 10, 12),
              //color: Colors.greenAccent,
              padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("放电上限"),
                                Text("放电下限"),
                              ],
                            ),
                          ),
                          Table(
                            border: TableBorder.all(
                              color: Colors.grey,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(children: [
                                Container(
                                  height: 30,
                                  alignment: AlignmentDirectional.center,
                                  child: Text("起始时间"),
                                ),
                                Text(
                                  "结束时间",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    //color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  height: 30,
                                  alignment: AlignmentDirectional.center,
                                  child: Text("电能方向"),
                                ),
                                Text(
                                  "功率",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    //color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  child: Text(
                                    "操作",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      //color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                  height: 30,
                                  alignment: AlignmentDirectional.center,
                                  child: Text("00:00"),
                                ),
                                Text(
                                  "04:00",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    //color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  height: 30,
                                  alignment: AlignmentDirectional.center,
                                  child: Text("充电"),
                                ),
                                Text(
                                  "60",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    //color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "/",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
