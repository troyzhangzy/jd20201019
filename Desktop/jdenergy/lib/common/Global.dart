
import 'emindapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/search_page.dart';
import '../widgets/userinfo_page.dart';
import '../widgets/upgrade.dart';

class Global {
  static String access_toke;
  static int station_id;

  static Future init() async {
    print('Global init func');

    EmindApi.init();
  }

  //退出app
  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  //主右键菜单
  static Widget mainMenu(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) async{
      print("select : $value");
        switch (value){
          case 'userinfo': {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return UserInfoPage(title: "用户",);
                  }
              ));
            }
            break;
          case 'search':{
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return SearchPage(title: "查找设备",station_id: Global.station_id??-1);
                  }
              ));
            }
            break;
          case 'upgrade':{
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return UpgradePage(title: "应用更新",);
                  }
              ));
            }
            break;
          case 'exit': {
            await Global.pop();
          }
          break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
        value: "userinfo",
        child: Text('用户信息'),
        ),
        const PopupMenuItem<String>(
        value: "search",
        child: Text('查找设备'),
        ),
        const PopupMenuItem<String>(
        value: "upgrade",
      child: Text('应用更新'),
      ),
      const PopupMenuItem<String>(
      value: "exit",
      child: Text('退出'),
      ),
      ],
    );
  }
}

