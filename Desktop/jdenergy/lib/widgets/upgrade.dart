
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';

class UpgradePage extends StatefulWidget{
  UpgradePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UpgradePageState createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  bool canUpdate=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:ListView(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 180,
              minWidth: double.infinity,
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
              child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
                    child:Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                //border: Border.all(color: Color(0xff0154a4),width: 1),
                                borderRadius: BorderRadius.circular(0)
                            ),
                            child:  Image(image: AssetImage("imgs/eMind96.png")),
                          ),

                        ],
                      ),
                    ),

                  )
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 12),
            child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 18, 25, 15),
                  child:Table(
                    columnWidths: <int, TableColumnWidth>{
                      0: FixedColumnWidth(60.0),
                      1: FixedColumnWidth(140.0),
                    },
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
                              child: Text("当前版本"),
                            ),
                            Text("1.01",style: TextStyle(
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
                              child: Text("最新版本"),
                            ),
                            Text("1.01",style: TextStyle(
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
                              child: Text("更新版本"),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                              child: FlatButton(
                                color: canUpdate?Colors.blue:Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                    "检查版本"
                                ),
                                onPressed: () async {
                                },
                              ),
                            ),


                          ]
                      ),
                    ],

                  ),
                )
            ),
          ),

        ],
      ),
    );
  }
}

