import 'package:aims/login/input_dognum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:aims/permission/permission.dart';

//앱 최초 실행 시 권한 확인
Future<bool> _checkStatus() async {
  if (await Permission.camera.isGranted && await Permission.storage.isGranted) {
    //input_dognum.dart로 이동
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
  Home() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void initState() {
    super.initState();

    _checkStatus().then((value) {
      if (value == false) {
        //권한이 허용안되어 있으면 권한 허용 페이지로 이동
        Get.off(() => permission());
      } else {
        //권한이 허용되어 있다면 로그인 페이지로 이동 (추후 자동로그인 구현 예정 따라서 변경 가능)
        Get.off(() => input_dognum());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
