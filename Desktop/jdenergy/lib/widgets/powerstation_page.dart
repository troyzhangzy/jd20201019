/*
电站信息主页面

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';
import '../widgets/eblock_page.dart';
import '../models/model_equipment.dart';
import '../models/model_equipment_list.dart';

class PowerStationPage extends StatefulWidget {
  PowerStationPage({Key key, this.title, this.station_id}) : super(key: key);

  final String title;
  final int station_id;

  @override
  _PowerStationPageState createState() => _PowerStationPageState();
}


class _PowerStationPageState extends State<PowerStationPage> {
  List<Widget> _eblocks;

  static const _kFontFam = 'APage';
  static const _kFontPkg = null;
  static const IconData yen = IconData(0xf157, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  double todayInCome =0;
  double cumulativeIncome =0;
  num dischargeAmount =0;
  num cumulativeDischargeAmount =0;
  num eNodeTotalCount =0;
  num eNodeOnlineCount =0;
  num remainingBattery = 0.0;
  num power_DC = 0.0;

  List<Model_equipment> equipment_list;

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    print('------------------_PowerStationPageState didChangeDependencies');
    var api =  EmindApi();
    var t0 = DateTime.parse("2020-01-01");
    var t1 = DateTime.now();
    var d = await api.get_data_home(t0, t1, widget.station_id);
//    var d2 = await api.get_data_stationlist();
//    var d3 = await api.get_data_stationcount();
    var d2 = await api.get_data_equipment_list(widget.station_id);
    print('--------await api.get_data_home d:$d');
    print('--------await api.get_data_equipment_list d2:$d2');
//    print('--------await api.get_data_stationcount d2:$d3');
    if(d != null || d2 != null /*|| d3 != null*/){
      setState(() {
        if(d != null) {
          dischargeAmount = d.dischargeAmount ?? 0;
          cumulativeDischargeAmount = d.cumulativeDischargeAmount ?? 0;
          eNodeTotalCount = d.eNodeTotalCount ?? 0;
          eNodeOnlineCount = d.eNodeOnlineCount ?? 0;
          todayInCome = d.todayInCome?.toDouble()??0.0;
          cumulativeIncome = d.cumulativeIncome?.toDouble() ?? 0.0;
          remainingBattery = d.remainingBattery?.toDouble() ?? 0.0;
          power_DC  = d.power_DC?.toDouble() ?? 0.0;
        }
        if(d2 != null){
//          stationNums = d2.data.length;
          equipment_list = d2.data;
          print("equipment_list:$equipment_list");
          init_eblocks(equipment_list?.length??0);
        }
//
//        if(d3 != null){
//          onlineStationNums = d3.data.onlineCount??0;
//        }
      });
    }
    print('----------------------_PowerStationPageState leave didChangeDependencies');
  }


  void init_eblocks(int num){
    _eblocks.clear();
    for(var i=0; i<num; i++){
      _eblocks.add(makeEBlockElement2(i, 1));
    }
  }

  @override
  void initState(){
    super.initState();
    _eblocks = new List();
  }
  @override
  void dispose(){
    super.dispose();
  }

  /*
  Widget makeEBlockElement(int no, int state){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return EBlockPage(title: "$no#能量块",);
            }
        ));
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(1, 1, 1, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.widgets,
              color: Color(0xff0154a4),
              size: 36.0,
              semanticLabel: '',
            ),
            Text("$no#能量块")
          ],
        ),

      ),
    );
  }
 */
  Widget makeEBlockElement2(int no, int state){
    Model_equipment equipment = equipment_list[no];
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return EBlockPage(title: "${equipment.name}",station_id: equipment.stationId, eBlock_id: equipment.id,);
            }
        ));
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.widgets,
              color: Color(0xff0154a4),
              size: 36.0,
              semanticLabel: '',
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 3),
              child: Text("${equipment.numbering}",textAlign: TextAlign.center,),
            ),
            Text("能量块",textAlign: TextAlign.center,style: TextStyle(
              fontSize: 10.0,
              color: Colors.grey,
            ),),
          ],
        ),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    print("---------------------------2---------");
    print("len:${_eblocks?.length??0}");
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 105,
              minWidth: double.infinity,
            ),
            child: Container(
                color: Color.fromARGB(255,0x01, 0x54, 0xA4),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 3, 12, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xffffffff),width: 1),
                            borderRadius: BorderRadius.circular(42)
                        ),
                        child:  Icon(
                          yen,
                          color: Color(0xff0154a4),
                          size: 32.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("当日收益:$todayInCome元",
                              style: TextStyle(fontSize: 16.0,color: Colors.white,)
                          ),
                          Text("累计收益:$cumulativeIncome元",
                              style: TextStyle(fontSize: 16.0,color: Colors.white,)
                          ),
                        ],
                      ),
                      Text("            ")
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
                        constraints: BoxConstraints(minWidth: 60,minHeight: 40),
                        child: Column(
                          children: <Widget>[
                            Text('${dischargeAmount}kWh',
                              style: TextStyle(fontSize: 14.0,color: Colors.grey,),),
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
                                size: 32.0,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                            ),

                            Text('当日放电',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 60,minHeight: 40),
                        child: Column(
                          children: <Widget>[
                            Text('${cumulativeDischargeAmount}kWh',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
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
                                size: 32.0,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                            ),

                            Text('累计放电',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 60,minHeight: 40),
                        child: Column(
                          children: <Widget>[
                            Text('${power_DC}kW',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
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
                                size: 32.0,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                            ),
                            Text('实时功率',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 60,minHeight: 40),
                        child: Column(
                          children: <Widget>[
                            Text('${remainingBattery}kWh',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
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
                                size: 32.0,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                            ),
                            Text('剩余电量',
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
              padding: EdgeInsets.fromLTRB(2, 15, 2, 5),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,//横轴元素个数
                    mainAxisSpacing: 1.0,//纵轴间距
                    crossAxisSpacing: 1.0,//横轴间距
                    childAspectRatio: 1.0,//子组件宽高长度比例
                  ),
                  itemCount: equipment_list?.length??0,
                  itemBuilder: (BuildContext context, int index){
                    return _eblocks[index];
                  },
              ),
//              child: GridView.count(
//                crossAxisCount: 4,
//                mainAxisSpacing: 0,
//                crossAxisSpacing: 0,
//                children: _eblocks,
//              ),
            ),
          ),

        ],
      ),
    );
  }

}

