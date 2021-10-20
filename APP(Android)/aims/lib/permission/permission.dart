import 'package:aims/login/login.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

const MethodChannel _channel = const MethodChannel('com.example.aims/camera');

Future<void> setPermission() async {
  await _channel.invokeMethod('setPermission');
}

Future<bool> _getStatus() async {
  Map<Permission, PermissionStatus> status = await [
    Permission.storage,
    Permission.camera,
    Permission.phone,
    Permission.microphone
  ].request();

  if (await Permission.camera.isGranted &&
      await Permission.storage.isGranted &&
      await Permission.phone.isGranted &&
      await Permission.microphone.isGranted) {
    return true;
  } else {
    return false;
  }
}

class permission extends StatefulWidget {
  @override
  _permission createState() => _permission();
}

class _permission extends State<permission> {
  permission() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(start: 20.0, end: 40.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/permission.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 50.0, end: 0.0),
            child: Container(
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: const Color(0xff212121))),
                onPressed: () {
                  setState(() {
                    setPermission();
                    _getStatus().then((value) {
                      if (value == true) {
                        Get.off(() => login());
                      } else {}
                    });
                  });
                },
                padding: EdgeInsets.all(10.0),
                color: const Color(0xff212121),
                textColor: const Color(0xffffffff),
                child: Text("권한 확인", style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
