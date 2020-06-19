

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';

class UserInfoPage extends StatefulWidget{
  UserInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    var pickfile = await picker.getImage(source: ImageSource.gallery);
    var image = File(pickfile.path);
    _upLoadImage(image);
    setState(() {
      _image = image;
    });
  }

  _upLoadImage(File image) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = FormData.fromMap({
      "thumb": await MultipartFile.fromFile(
          image.path, filename: name)
    });

//    Dio dio = new Dio();
//    var respone = await dio.post<String>("/upload", data: formData);
//    if (respone.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "图片上传成功",
          gravity: ToastGravity.CENTER,
          textColor: Colors.grey);
//    }
  }

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
                      child:Row(
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
                            child:  InkWell(
                              onTap: ()async {
                                await getImage();
                              },
                              child: Icon(
                                Icons.person,
                                color: Color(0xff0154a4),
                                size: 56.0,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 70,
                                      child: Text("用 户 名:",
                                          style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                      ),
                                    ),
                                    Text("秦岭",
                                        style: TextStyle(fontSize: 14.0,color: Colors.grey,)
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 70,
                                      child: Text("微 信 号:",
                                          style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                      ),
                                    ),
                                    Text("133245678",
                                        style: TextStyle(fontSize: 14.0,color: Colors.grey,)
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 70,
                                      child: Text("联系方式:",
                                          style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                      ),
                                    ),
                                    Text("133245678",
                                        style: TextStyle(fontSize: 14.0,color: Colors.grey,)
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 70,
                                      child: Text("公司名称:",
                                          style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Text("深圳乾坤有限公司西安分公司第一办公室第一小组",
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                          maxLines: 3,
                                          style: TextStyle(fontSize: 14.0,color: Colors.grey,)
                                      ),
                                    )

                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),

                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(12, 0, 10, 0),
              //alignment: AlignmentDirectional.topStart,
              child: Text("修改密码:",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0,color: Colors.black,)
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 12),
              child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 18, 5, 15),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 70,
                                child: Text("输入密码:",
                                    style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 200,
                                child: TextField(
                                  autofocus: false,
                                  obscureText: true,
                                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: "输入密码",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    fillColor: Colors.blueGrey,
                                    contentPadding: EdgeInsets.fromLTRB(15, 2, 10, 2),
                                    //prefixIcon: Icon(Icons.lock),
                                  ),
                                  onChanged: (v){
//                                    login=v.trim();
//                                    setLoginState();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 70,
                                child: Text("确认密码:",
                                    style: TextStyle(fontSize: 14.0,color: Colors.black,)
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 200,
                                child: TextField(
                                  autofocus: false,
                                  obscureText: true,
                                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: "再次输入密码",
                                    border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    ),
                                    fillColor: Colors.blueGrey,
                                    contentPadding: EdgeInsets.fromLTRB(15, 2, 10, 2),
                                    //prefixIcon: Icon(Icons.lock),
                                  ),
                                  onChanged: (v){
//                                    login=v.trim();
//                                    setLoginState();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 160,
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: FlatButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                                "更改密码"
                            ),
                            onPressed: () async {

                            },
                          ),
                        )

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

