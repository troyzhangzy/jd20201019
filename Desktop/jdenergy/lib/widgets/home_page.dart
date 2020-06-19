import 'package:flutter/cupertino.dart';
///首页


import 'package:flutter/material.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';
import '../widgets/powerstation_page.dart';
import '../widgets/powerstation_shell.dart';
import '../models/index.dart';

class EmindHomePage extends StatefulWidget {
  EmindHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _EmindHomePageState createState() => _EmindHomePageState();
}

class _EmindHomePageState extends State<EmindHomePage> {
  double todayInCome =0;
  double cumulativeIncome =0;
  num dischargeAmount =0;
  num cumulativeDischargeAmount =0;
  num eNodeTotalCount =0;
  num eNodeOnlineCount =0;

  //电站台数
  num stationNums =0;
  num onlineStationNums = 0;
  List<Model_station> station_list;

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    print('------------------didChangeDependencies');
    var api =  EmindApi();
    var t0 = DateTime.parse("2020-01-01");
    var t1 = DateTime.now();
    var d = await api.get_data_home(t0, t1);
    var d2 = await api.get_data_stationlist();
    var d3 = await api.get_data_stationcount();
    print('--------await api.get_data_home d:$d');
    print('--------await api.get_data_stationlist d2:$d2');
    print('--------await api.get_data_stationcount d2:$d3');
    if(d != null || d2 != null || d3 != null){
      setState(() {
        if(d != null) {
          dischargeAmount = d.dischargeAmount ?? 0;
          cumulativeDischargeAmount = d.cumulativeDischargeAmount ?? 0;
          eNodeTotalCount = d.eNodeTotalCount ?? 0;
          eNodeOnlineCount = d.eNodeOnlineCount ?? 0;
          todayInCome = d.todayInCome?.toDouble()??0.0;
          cumulativeIncome = d.cumulativeIncome?.toDouble() ?? 0.0;
        }
        if(d2 != null){
          stationNums = d2.data.length;
          station_list = d2.data;
        }

        if(d3 != null){
          onlineStationNums = d3.data.onlineCount??0;
        }
      });
    }
    print('----------------------leave didChangeDependencies');
  }

  DateTime _lastPressExit;
/*
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Global.mainMenu(context),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 95,
                minWidth: double.infinity,
              ),
              child: Container(
                color: Color.fromARGB(255,0x01, 0x54, 0xA4),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                        child: Column(
                          children: <Widget>[
                            Text('$todayInCome',
                              style: TextStyle(fontSize: 18.0,color: Colors.white,),),
                            Text('当日收益',
                              style: TextStyle(fontSize: 14.0,color: Colors.white,), ),
                            Text('(元)',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                        child: Column(
                          children: <Widget>[
                            Text('$cumulativeIncome',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),),
                            Text('累计收益',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            Text('(元)',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                        child: Column(
                          children: <Widget>[
                            Text('$dischargeAmount',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),),
                            Text('当日放电',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            Text('(kWh)',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                        child: Column(
                          children: <Widget>[
                            Text('$cumulativeDischargeAmount',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),),
                            Text('累计放电',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            Text('(kWh)',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )

              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 95,
                minWidth: double.infinity,
              ),
              child: Container(
                  color: Color.fromARGB(0,0x01, 0x54, 0xA4),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                          child: Column(
                            children: <Widget>[
                              Text('电站总数',
                                style: TextStyle(fontSize: 14.0,color: Colors.black,),),
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff0154a4),width: 1),
                                    borderRadius: BorderRadius.circular(42)
                                ),
                                child:  Icon(
                                  Icons.camera_roll,
                                  color: Color(0xff0154a4),
                                  size: 28.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                              ),

                              Text('$stationNums台',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                          child: Column(
                            children: <Widget>[
                              Text('电站运行数',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),),
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff0154a4),width: 1),
                                    borderRadius: BorderRadius.circular(42)
                                ),
                                child:  Icon(
                                  Icons.battery_charging_full,
                                  color: Color(0xff0154a4),
                                  size: 28.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                              ),

                              Text('195台',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                          child: Column(
                            children: <Widget>[
                              Text('能量块总数',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),),
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff0154a4),width: 1),
                                    borderRadius: BorderRadius.circular(42)
                                ),
                                child:  Icon(
                                  Icons.developer_board,
                                  color: Color(0xff0154a4),
                                  size: 28.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                              ),
                              Text('$eNodeTotalCount台',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                          child: Column(
                            children: <Widget>[
                              Text('能量块运行数',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),),
                              Container(
                                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff0154a4),width: 1),
                                    borderRadius: BorderRadius.circular(42)
                                ),
                                child:  Icon(
                                  Icons.settings_input_component,
                                  color: Color(0xff0154a4),
                                  size: 28.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                              ),
                              Text('$eNodeOnlineCount台',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black12,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: PageView(
                  children: <Widget>[
                    ListView.builder(
                      //itemExtent: 50.0,
                      itemCount: stationNums,
                      itemBuilder: (BuildContext context, int index){
                        var station_name = station_list==null?"111":station_list[index].name;
                        var station_address = station_list==null?"":station_list[index].address;
                        var capacity = station_list==null?"":station_list[index].capacity;
                        var maxPower = station_list==null?"":station_list[index].maxPower;
                          return Container(
                            padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                            //color: Colors.lime,
                            child: Card(
                              child: ListTile(
                                title: Text("电站--${station_name}"),
                                subtitle: Text("${station_address}--${maxPower}kW/${capacity}kWh"),
                                trailing: Icon(Icons.chevron_right),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context){
                                        return PowerStationShell(title: "${station_name}",);
                                      }
                                  ));
                                },
                              ),
                            )
                          );
                        }),
                    Text("本界面是百度地图"),
//                    Column(
//                      children: <Widget>[
//                        Text(
//                          'You have pushed the button this many times:',
//                        ),
//                        Text(
//                          '$_counter',
//                          style: Theme.of(context).textTheme.headline4,
//                        ),
//                        FlatButton(
//                          child: Text("open new route"),
//                          textColor: Colors.blue,
//                          onPressed: (){
//                            Navigator.push(context, MaterialPageRoute(
//                                builder: (context){
//                                  return PowerStationPage(title: "深圳乾坤--1#电站",);
//                                }
//                            ));
//                          },
//                        ),
//                      ],
//                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
*/

  Future<bool> _onWillPop() async{
    /*
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('操作确认'),
        content: new Text('确定退出本程序吗?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('取消'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('退出'),
          ),
        ],
      ),
    ) ?? false;
    */

    if(_lastPressExit == null ||
        DateTime.now().difference(_lastPressExit) > Duration(seconds: 1)
    ){
        _lastPressExit = DateTime.now();
        return false;
    }
    return true;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Global.mainMenu(context),
          ],
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 95,
                  minWidth: double.infinity,
                ),
                child: Container(
                    color: Color.fromARGB(255,0x01, 0x54, 0xA4),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                            child: Column(
                              children: <Widget>[
                                Text('$todayInCome',
                                  style: TextStyle(fontSize: 18.0,color: Colors.white,),),
                                Text('当日收益',
                                  style: TextStyle(fontSize: 14.0,color: Colors.white,), ),
                                Text('(元)',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                            child: Column(
                              children: <Widget>[
                                Text('$cumulativeIncome',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),),
                                Text('累计收益',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text('(元)',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                            child: Column(
                              children: <Widget>[
                                Text('$dischargeAmount',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),),
                                Text('当日放电',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text('(kWh)',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                            child: Column(
                              children: <Widget>[
                                Text('$cumulativeDischargeAmount',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                  ),),
                                Text('累计放电',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text('(kWh)',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )

                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 95,
                  minWidth: double.infinity,
                ),
                child: Container(
                    color: Color.fromARGB(0,0x01, 0x54, 0xA4),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                            child: Column(
                              children: <Widget>[
                                Text('电站总数',
                                  style: TextStyle(fontSize: 14.0,color: Colors.black,),),
                                Container(
                                  margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff0154a4),width: 1),
                                      borderRadius: BorderRadius.circular(42)
                                  ),
                                  child:  Icon(
                                    Icons.camera_roll,
                                    color: Color(0xff0154a4),
                                    size: 28.0,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                ),

                                Text('$stationNums台',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                            child: Column(
                              children: <Widget>[
                                Text('电站运行数',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),),
                                Container(
                                  margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff0154a4),width: 1),
                                      borderRadius: BorderRadius.circular(42)
                                  ),
                                  child:  Icon(
                                    Icons.battery_charging_full,
                                    color: Color(0xff0154a4),
                                    size: 28.0,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                ),

                                Text('$onlineStationNums台',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                            child: Column(
                              children: <Widget>[
                                Text('能量块总数',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),),
                                Container(
                                  margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff0154a4),width: 1),
                                      borderRadius: BorderRadius.circular(42)
                                  ),
                                  child:  Icon(
                                    Icons.developer_board,
                                    color: Color(0xff0154a4),
                                    size: 28.0,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                ),
                                Text('$eNodeTotalCount台',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 60,minHeight: 50),
                            child: Column(
                              children: <Widget>[
                                Text('能量块运行数',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),),
                                Container(
                                  margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff0154a4),width: 1),
                                      borderRadius: BorderRadius.circular(42)
                                  ),
                                  child:  Icon(
                                    Icons.settings_input_component,
                                    color: Color(0xff0154a4),
                                    size: 28.0,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                ),
                                Text('$eNodeOnlineCount台',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black12,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: PageView(
                    children: <Widget>[
                      ListView.builder(
                        //itemExtent: 50.0,
                          itemCount: stationNums,
                          itemBuilder: (BuildContext context, int index){
                            var station_name = station_list==null?"111":station_list[index].name;
                            var station_id = station_list==null?"111":station_list[index].id;
                            var station_address = station_list==null?"":station_list[index].address;
                            var capacity = station_list==null?"":station_list[index].capacity;
                            var maxPower = station_list==null?"":station_list[index].maxPower;
                            return Container(
                                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                //color: Colors.lime,
                                child: Card(
                                  child: ListTile(
                                    title: Text("电站--${station_name}"),
                                    subtitle: Text("${station_address}--${maxPower}kW/${capacity}kWh"),
                                    trailing: Icon(Icons.chevron_right),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context){
                                            Global.station_id = station_id;
                                            return PowerStationShell(title: "${station_name}", station_id: station_id,);
                                          }
                                      ));
                                    },
                                  ),
                                )
                            );
                          }),
                      Text("本界面是百度地图"),
//                    Column(
//                      children: <Widget>[
//                        Text(
//                          'You have pushed the button this many times:',
//                        ),
//                        Text(
//                          '$_counter',
//                          style: Theme.of(context).textTheme.headline4,
//                        ),
//                        FlatButton(
//                          child: Text("open new route"),
//                          textColor: Colors.blue,
//                          onPressed: (){
//                            Navigator.push(context, MaterialPageRoute(
//                                builder: (context){
//                                  return PowerStationPage(title: "深圳乾坤--1#电站",);
//                                }
//                            ));
//                          },
//                        ),
//                      ],
//                    )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }
}



class NewRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Vertical Divider Example'),
      ),
      body: Center(
        child:Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 100,
            width: 60,
          ),
          VerticalDivider(color: Colors.black,
            thickness: 2, width: 20,
            indent: 200,
            endIndent: 200,),
          Container(
            color: Colors.blue,
            height: 100,
            width: 60,
          ),
          VerticalDivider(color: Colors.black,
            thickness: 2, width: 20,
            indent: 200,
            endIndent: 200,),
          Container(
            color: Colors.blue,
            height: 100,
            width: 60,
          ),VerticalDivider(color: Colors.black,
            thickness: 2, width: 20,
            indent: 200,
            endIndent: 200,),
          Container(
            color: Colors.blue,
            height: 100,
            width: 60,
          ),
        ],
      ),
      ),
    );
  }
}