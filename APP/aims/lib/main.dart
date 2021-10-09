import 'dart:async';

import 'package:aims/login/viewimage.dart';
import 'package:aims/signup/chk_info.dart';
import 'package:aims/signup/finish_signup.dart';
import 'package:aims/signup/input_dognum.dart';
import 'package:aims/signup/input_unitnum.dart';
import 'package:aims/login/login.dart';
import 'package:aims/signup/pledge/pledge_1.dart';
import 'package:aims/signup/pledge/pledge_2.dart';
import 'package:aims/signup/pledge/pledge_3.dart';
import 'package:aims/signup/pledge/signature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:aims/permission/permission.dart';

import 'signup/pledge/chk_pledge.dart';

//앱 최초 실행 시 권한 확인
Future<bool> _checkStatus() async {
  if (await Permission.camera.isGranted && await Permission.storage.isGranted) {
    //login.dart로 이동
    return true;
  } else {
    //permission.dart로 이동
    return false;
  }
}

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/chk_pledge', page: () => chk_pledge()),
        GetPage(name: '/input_unitnum', page: () => input_unitnum()),
        GetPage(name: '/chk_info', page: () => chk_info()),
        GetPage(name: '/pledge_1', page: () => pledge_1()),
        GetPage(name: '/pledge_2', page: () => pledge_2()),
        GetPage(name: '/pledge_3', page: () => pledge_3()),
        GetPage(name: '/signature', page: () => signature()),
        GetPage(name: '/finish_signup', page: () => finish_signup()),
        GetPage(name: '/view_image', page: () => viewimage()),
      ],
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

Future<bool> fetchData() async {
  bool data = false;

  // Change to API call
  await Future.delayed(Duration(seconds: 1), () {
    data = true;
  });

  return data;
}

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    _checkStatus().then((value) {
      if (value == false) {
        //권한이 허용안되어 있으면 권한 허용 페이지로 이동
        Get.off(() => permission());
      } else {
        //권한이 허용되어 있다면 로그인 페이지로 이동 (추후 자동로그인 구현 예정 따라서 변경 가능)
        Get.off(() => login());
      }
    });
  }

  Home() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Container(
          child: Center(
              child: new Image.asset('image/logo_white_kor.png',
                  width: 250, height: 250)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffe6ffd7),
                Color(0xff536349),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
