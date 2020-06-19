import 'package:flutter/material.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';
import '../widgets/powerstation_page.dart';
import '../widgets/income_page.dart';
import '../widgets/power_page.dart';
import '../widgets/set_page.dart';

class PowerStationShell extends StatefulWidget {
  PowerStationShell({Key key, this.title, this.station_id}) : super(key: key);

  final String title;
  final int station_id;

  @override
  _PowerStationShellState createState() => _PowerStationShellState();
}


class _PowerStationShellState extends State<PowerStationShell> {


  void setPos(int pos){
    setState(() {
      CurPos = pos;
    });
    if(_controller.hasClients){
      _controller.animateToPage(CurPos, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  PageController _controller ;
  int CurPos ;

  @override
  void initState(){
    super.initState();
    CurPos = 0;
    _controller = PageController(
      initialPage: CurPos,
    );
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fb),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context,"");
          },
        ),
        actions: <Widget>[
          Global.mainMenu(context),
        ],
        title: Text(widget.title),
      ),
      body:Center(
        child: PageView(
          controller: _controller,
          children: <Widget>[
            PowerStationPage(title: widget.title,station_id: widget.station_id,),
            IncomePage(title: widget.title),
            PowerPage(title: widget.title,),
            SetPage(title: widget.title,),
          ],
        ),
      ) ,

//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //color: CurPos==0?Colors.lightGreenAccent:null,
              child: FlatButton(
                child: Text("电站",
                    style: TextStyle(fontSize: CurPos==0?16.0:14.0,color: CurPos==0?Colors.blue:Colors.black,)
                ),
                onPressed: (){
                  setPos(0);
                },
              ),
            ),
            Container(
              //color: CurPos==1?Colors.lightGreenAccent:null,
              child: FlatButton(
                child: Text("收益",
                    style: TextStyle(fontSize: CurPos==1?16.0:14.0,color: CurPos==1?Colors.blue:Colors.black,)
                ),
                onPressed: (){
                  setPos(1);
                },
              ),
            ),
            Container(
              //color: CurPos==2?Colors.lightGreenAccent:null,
              child: FlatButton(
                child: Text("电量",
                    style: TextStyle(fontSize: CurPos==2?16.0:14.0,color: CurPos==2?Colors.blue:Colors.black,)
                ),
                onPressed: (){
                  setPos(2);
                },
              ),
            ),
            Container(
              //color: CurPos==3?Colors.lightGreenAccent:null,
              child: FlatButton(
                child: Text("设置",
                    style: TextStyle(fontSize: CurPos==3?16.0:14.0,color: CurPos==3?Colors.blue:Colors.black,)
                ),
                onPressed: (){
                  setPos(3);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

