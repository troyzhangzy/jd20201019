
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/Global.dart';
import '../common/emindapi.dart';
import '../widgets/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

//const VIP = "j30s029503.wicp.vip:80";
//String ACCESS_TOKEN = null;

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage>{
  String login;
  String password;
  bool canLogin=false;
  SharedPreferences prefs;

  void setLoginState(){
      if (login.length>0 && password.length>0){
        setState((){
          canLogin = true;
        });
      }else{
        setState((){
          canLogin = false;
        });
      }
  }

  void saveUser(){
    print("--------------saveUser:$prefs");
    prefs?.setString("login",login);
    prefs?.setString("password",password);

  }

  Future<bool> doLogin() async{
    var api =  EmindApi();
    print('begin call api.doLogin');
    var retn = await api.doLogin(login, password);
    print(retn);
    if(retn){
      saveUser();
    }
    return retn;
  }

  @override
  void initState()  {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    prefs = await SharedPreferences.getInstance();
    if (prefs != null){
      login = prefs?.getString("login");
      password = prefs.getString("password");
      setLoginState();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: Text(""),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 55,
                maxWidth: 120,
              ),
              child: Image( image: AssetImage("imgs/login.png"),),
            ),
          ),
          SizedBox(
            height: 80,
            child: Text(""),
          ),
          Container(
            height: 55,
            padding: EdgeInsets.fromLTRB(60, 0, 60, 10),
            child: TextField(
              autofocus: false,
              controller: TextEditingController.fromValue(TextEditingValue(
                  text: '${this.login == null ? "" : this.login}',  //判断keyword是否为空
                  selection: TextSelection.fromPosition(TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: '${this.login}'.length))
                  ),
                ),
              style: TextStyle(fontSize: 16.0, color: Colors.black,),
              decoration: InputDecoration(
                  hintText: "请输入用户名",
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Colors.blueGrey,
                  prefixIcon: Icon(Icons.person)
              ),
              onChanged: (v){
                login=v.trim();
                setLoginState();
              },
            ),
          ),
          Container(
            height: 55,
            padding: EdgeInsets.fromLTRB(60, 0, 60, 10),
            child: TextField(
              autofocus: false,
              controller: TextEditingController.fromValue(TextEditingValue(
                    text: '${this.password == null ? "" : this.password}',  //判断keyword是否为空
                    selection: TextSelection.fromPosition(TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: '${this.password}'.length))
                ),
              ),
              obscureText: true,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "请输入密码",
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.lock)
              ),
              onChanged: (v){
                password=v.trim();
                setLoginState();
              },
            ),
          ),
          SizedBox(
            height: 30,
            child: Text(""),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(70, 10, 70, 20),
            child: SizedBox(
              width:50,
              height: 50,
              child: FlatButton(
                color: canLogin?Colors.blue:Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Text(
                    "立即登录"
                ),
                onPressed: () async {
                  if(login.length>0 && password.length>0){
                    var brtn = await doLogin();
                    if(brtn){
                      print("doLogin ok");
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return EmindHomePage(title:"首页");
                          }
                      ));
                    }else{
                      print("doLogin failure");
                      Fluttertoast.showToast(
                          msg: "登录失败，请检查用户名或密码",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

