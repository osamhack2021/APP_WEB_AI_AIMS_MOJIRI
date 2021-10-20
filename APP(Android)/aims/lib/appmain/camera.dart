import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Takecamera extends StatefulWidget {
  @override
  _Takecamera createState() => _Takecamera();
}

class _Takecamera extends State<Takecamera> with WidgetsBindingObserver {
  static const MethodChannel _channel =
      const MethodChannel('com.example.aims/camera');
  CameraController? _cameraController;
  Future<void>? _initCameraControllerFuture;
  int cameraIndex = 0;

  bool isCapture = false;
  File? captureImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _initCamera();
  }

  void enableCamera() {
    _channel.invokeMethod('setEnableCamera');
  }

  void disableCameraFinishTaking() {
    _channel.invokeMethod('setDisableCameraFinishTaking');
  }

  Future<void> _initCamera() async {
    enableCamera();
    final cameras = await availableCameras();
    _cameraController =
        new CameraController(cameras[cameraIndex], ResolutionPreset.veryHigh);
    _initCameraControllerFuture = _cameraController!.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // 위젯의 생명주기 종료시 컨트롤러 역시 해제시켜줍니다.
    WidgetsBinding.instance!.removeObserver(this);
    _cameraController!.dispose();
    disableCameraFinishTaking();
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
      body: FutureBuilder<void>(
        future: _initCameraControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _cameraController?.setFlashMode(FlashMode.off);
            return CameraPreview(_cameraController!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white30,
        onPressed: () async {
          try {
            await _cameraController!.takePicture().then((value) {
              captureImage = File(value.path);
            });

            /// 화면 상태 변경 및 이미지 저장
            setState(() {
              isCapture = true;
            });
          } catch (e) {
            print("$e");
          }
          setState(() async {
            Get.toNamed("/view_image", arguments: captureImage);
          });
        },
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
