
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';
import '../widgets/eblock_page.dart';
import '../widgets/barcode_page.dart';
import 'package:barcode_scan/barcode_scan.dart';

class SearchPage extends StatefulWidget{
  SearchPage({Key key, this.title, this.station_id}) : super(key: key);

  final String title;
  final int station_id;

  @override
  _SearchPageState createState() => _SearchPageState();
}
Future scan() async {
  try {
    // 此处为扫码结果，barcode为二维码的内容
    String barcode = await BarcodeScanner.scan();
    print('扫码结果: '+barcode);
  } on PlatformException catch (e) {
    if (e.code == BarcodeScanner.CameraAccessDenied) {
      // 未授予APP相机权限
      print('未授予APP相机权限');
    } else {
      // 扫码错误
      print('扫码错误: $e');
    }
  } on FormatException{
    // 进入扫码页面后未扫码就返回
    print('进入扫码页面后未扫码就返回');
  } catch (e) {
    // 扫码错误
    print('扫码错误: $e');
  }
}
class _SearchPageState extends State<SearchPage> {
  String _eblock_no;
  final _controller = TextEditingController();
  String name ="03030102";

  void _set_eblock_no(String eblock_no) {
    setState(() {
      _eblock_no = eblock_no;
    });
  }

  @override
  void initState(){
    super.initState();

  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    print('------------------SearchPage didChangeDependencies');
    var api =  EmindApi();

    //演示调用 搜索函数
    //实际上打开界面时，不需要自动调用查询函数
    // name 即 界面上输入框内容
    var d = await api.search_data_equipment_list(widget.station_id, name);
    if(d != null ){
      setState(() {
        if(d != null) {
        }
      });
    }
    print('----------------------SearchPage leave didChangeDependencies');
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      height: 40,
                      child: TextField(
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "请输入设备号",
                          contentPadding: EdgeInsets.fromLTRB(15, 2, 10, 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),

                          ),
                        ),
                        controller: TextEditingController.fromValue(TextEditingValue(
                          text: "${this._eblock_no == null?"":_eblock_no}",
                        )),
                        onChanged: (v){
                          _set_eblock_no(v);
                        },
                      ),
                    )
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child:
                  InkWell(
                    onTap: () async{
                      var result = await BarcodeScanner.scan();
                      print(result);
                      _set_eblock_no(result);
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            var no = result.substring(0,result.length<13?result.length:13);
                            return EBlockPage(title: "$no-能量块",);
                            //return EBlockPage(title: "$no-能量块",);
                          }
                      ));
                      print("扫描二维码");
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Icon(Icons.crop_free),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text("扫一扫",
                              style: TextStyle(fontSize: 16.0,color: Colors.blue,),
                            ),
                            Text("扫描设备二维码")
                          ],
                        )
                      ],
                    ),
                  ),

            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      child: Card(
                        child: ListTile(
                          title: Text("$index#eBlock"),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  //return PowerStationPage(title: "深圳乾坤--$index#电站",);
                                  return EBlockPage(
                                    title: "$index#能量块",);
                                }
                            ));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
    );
  }
}

