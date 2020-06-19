import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_echarts/flutter_echarts.dart';

class IncomePage extends StatefulWidget {
  IncomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  int _counter = 0;

  static const _kFontFam = 'APage';
  static const _kFontPkg = null;

  static const IconData yen = IconData(0xf157, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget buildIncomeCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              decoration: BoxDecoration(
                  color: Color(0xff0154a4),
                  border: Border.all(color: Color(0xffffffff), width: 1),
                  borderRadius: BorderRadius.circular(42)),
              child: Icon(
                yen,
                color: Colors.white,
                size: 32.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("当日收益:1286元",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    )),
                Text("当月收益:30452.45元",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    )),
                Text("累计收益:123464.35元",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    )),
              ],
            ),
            Text("            ")
          ],
        ),
      )),
    );
  }

  String _satisticByDay = '''
    {
      grid: {
        left: 40
      },
      title:{
        show: true,
        text: '日收益',
      },
      color: ['#0154a4'],
      padding: 10,
      xAxis: {
        
        type: 'category',
        data: ['1', '2', '3', '4', '5', '6', '7','8', '9', '10', '11', '12', '13', '14','15','16', '17', '18', '19', '20', '21', '22','23', '24', '25', '26', '27', '28', '29','30']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290, 1330, 1320, 820],
        type: 'bar'
      }]
    }
  ''';

  String _satisticByMonth = '''
    {
      grid: {
        left: 40
      },
      title:{
        show: true,
        text: '月收益',
      },
      color: ['#0154a4'],
      padding: 10,
      xAxis: {
        
        type: 'category',
        data: ['1', '2', '3', '4', '5', '6', '7','8', '9', '10', '11', '12']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934, 1290],
        type: 'bar'
      }]
    }
  ''';

  String _satisticByYear = '''
    {
      grid: {
        left: 40
      },
      title:{
        show: true,
        text: '年收益',
      },
      color: ['#0154a4'],
      padding: 10,
      xAxis: {
        
        type: 'category',
        data: ['2010', '2011', '2012', '2013', '2014', '2015', '2016','2017', '2018', '2019', '2020']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320,820, 932, 901, 934],
        type: 'bar'
      }]
    }
  ''';

  Widget buildIncomeStatisticWidget(BuildContext context, String optionString) {
    print("build day");

    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
      child: Card(    
        
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),  //设置圆角
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
    return ListView(
        
        children: <Widget>[
          buildIncomeCard(context),
          buildIncomeStatisticWidget(context, _satisticByDay),
          buildIncomeStatisticWidget(context, _satisticByMonth),
          buildIncomeStatisticWidget(context, _satisticByYear),
        ],
      
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
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 125,
                minWidth: double.infinity,
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                          decoration: BoxDecoration(
                              color: Color(0xff0154a4),
                              border: Border.all(color: Color(0xffffffff),width: 1),
                              borderRadius: BorderRadius.circular(42)
                          ),
                          child:  Icon(
                            Icons.camera_roll,
                            color: Colors.white,
                            size: 36.0,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("当日收益:1286元",
                                style: TextStyle(fontSize: 16.0,color: Colors.black,)
                            ),
                            Text("当月收益:30452.45元",
                                style: TextStyle(fontSize: 16.0,color: Colors.black,)
                            ),
                            Text("累计收益:123464.35元",
                                style: TextStyle(fontSize: 16.0,color: Colors.black,)
                            ),
                          ],
                        ),
                        Text("            ")
                      ],
                    ),
                  )
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              child: Text("电站"),
              onPressed: (){},
            ),
            FlatButton(
              child: Text("收益"),
              onPressed: (){},
            ),
            FlatButton(
              child: Text("电量"),
              onPressed: (){},
            ),
            FlatButton(
              child: Text("设置"),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
   */
}
