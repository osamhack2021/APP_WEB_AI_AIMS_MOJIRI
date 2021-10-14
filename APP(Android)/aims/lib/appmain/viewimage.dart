import 'dart:convert';
import 'dart:io';

import 'package:aims/appmain/app_main.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class viewimage extends StatefulWidget {
  @override
  _viewimage createState() => _viewimage();
}

class _viewimage extends State<viewimage> with WidgetsBindingObserver {
  static const MethodChannel _channel =
      const MethodChannel('com.example.aims/camera');
  bool chkGetout = false;

  Future<void> disableCamera() async {
    await _channel.invokeMethod('setDisableCamera');
  }

  Future<void> enableCamera() async {
    await _channel.invokeMethod('setEnableCamera');
  }

  void disableCameraFinishTaking() {
    _channel.invokeMethod('setDisableCameraFinishTaking');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  // 앱 상태 변경시 호출
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        disableCameraFinishTaking();
        exit(0);
      case AppLifecycleState.paused:
        disableCameraFinishTaking();
        exit(0);
      case AppLifecycleState.detached:
        disableCameraFinishTaking();
        exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 300.0, start: 36.0),
            Pin(size: 33.0, start: 63.0),
            child: Text(
              '촬영한 사진을 확인해주세요',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(start: 120.0, end: 130.0),
            //넘겨받은 군번과 부대코드 다시 넘겨야함
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(Get.arguments), fit: BoxFit.contain),
              ),
            ),
          ),
          Pinned.fromPins(
              Pin(start: 35.0, end: 35.0), Pin(size: 65.0, end: 20.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.undo_rounded),
                      label: Text("다시 촬영"),
                      backgroundColor: Colors.lightBlue[200],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() async {
                          List<int> fileInByte =
                              Get.arguments.readAsBytesSync();
                          String img64 = base64Encode(fileInByte);
                          disableCameraFinishTaking();
                          Get.toNamed("/send_image", arguments: img64);
                        });
                      },
                      icon: Icon(Icons.photo_camera_back_rounded),
                      label: Text("사진 선택"),
                      backgroundColor: Colors.lightBlue[200],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
