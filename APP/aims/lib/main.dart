import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:aims/permission/permission2.dart';

//앱 최초 실행 시 권환 확인
Future<bool> _getStatus() async {
  //Map<Permission, PermissionStatus> status =
  //await [Permission.storage, Permission.camera].request();

  if (await Permission.camera.isGranted && await Permission.storage.isGranted) {
    return true;
  } else {
    //permission.dart로 이동
    return false;
  }
}

Future<void> main() async {
  bool data = await fetchData();
  print(data);

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
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  void initState() {
    //Get.to(permission());
    Future<bool> data = _getStatus();
    if (data != true) {
      // 권한이 차단되어있다면 첫 실행으로 판단. 따라서 권한허용 페이지로 이동.
      Get.off(() => permission2());
    } else {
      // 권한이 허용되어있다면 첫 실행이 아니니 로그인으로.
      //Get.off(() => login_page());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('main Page'),
      ),
    );
  }
}
