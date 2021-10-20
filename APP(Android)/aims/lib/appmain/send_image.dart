import 'dart:convert';
import 'dart:io';

import 'package:aims/appmain/app_main.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';

String responsebody = 'true';

Future<String> _postRequest(String img64) async {
  Map data = {"image": img64};

  var body = json.encode(data);

  var response = await http.post(
      Uri.http('20.194.62.71', 'pictures/create'), // ex ) http://123.0.0.0/test
      headers: {"Content-Type": "application/json"},
      body: body);

  if (response.statusCode == 201 || response.statusCode == 200) {
    responsebody = response.body;
    return response.body;
  } else if (response.statusCode == 504) {
    Fluttertoast.showToast(
        msg: 'response Body : ' + response.body + '서버통신미흡 response 504',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    throw Exception('Failed to contect Server.');
  } else {
    Fluttertoast.showToast(
        msg: '코드 올바르지 않음.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    throw Exception('Failed to contect Server.');
  }
}

class send_image extends StatefulWidget {
  @override
  _send_image createState() => _send_image();
}

class _send_image extends State<send_image> with WidgetsBindingObserver {
  static const MethodChannel _channel =
      const MethodChannel('com.example.aims/camera');
      
      void disableCameraFinishTaking() async {
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

  //응답 성공했을 때의 뷰
  //responsebody가 base64코드면 이미지를 보여주고 다운로드하게끔
  //responsebody가 'false'이면 이미지 처리 실패. 다시 촬영하게끔
  Widget _successView() {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 10.0, end: 10.0),
            Pin(size: 40.0, start: 40.0),
            child: Text(
              '결과물을 확인하세요',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 25,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(start: 83.0, end: 80.0),
            //넘겨받은 군번과 부대코드 다시 넘겨야함
            child: Image.memory(
              const Base64Codec().decode(responsebody),
            ),
          ),
          Pinned.fromPins(
              Pin(start: 10.0, end: 10.0), Pin(size: 45.0, end: 10.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        await ImageGallerySaver.saveImage(const Base64Codec()
                            .decode(responsebody)
                            .buffer
                            .asUint8List());
                        Fluttertoast.showToast(
                            msg: '기기에 저장되었습니다.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      icon: Icon(Icons.file_download),
                      label: Text("저장하기"),
                      backgroundColor: Colors.lightBlue[200],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          Get.offAll(app_main());
                        });
                      },
                      icon: Icon(Icons.home_filled),
                      label: Text("메인으로"),
                      backgroundColor: Colors.lightBlue[200],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _errorView() {
    //errorview를 띄우면서 카메라차단해야함
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Pinned.fromPins(
          Pin(start: 38.0, end: 38.0),
          Pin(start: 150.0, size: 100.0),
          child: Text(
            'ERROR',
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'NanumGothic',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Pinned.fromPins(
          Pin(start: 38.0, end: 38.0),
          Pin(start: 220.0, size: 1.0),
          child: SizedBox(
            height: 20.0,
            width: 150,
            child: Divider(
              color: Colors.black,
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 38.0, end: 38.0),
          Pin(start: 250.0, size: 100.0),
          child: Text(
            '오류가 발생했습니다.\n다시 시도해 주세요.',
            style: TextStyle(
                fontFamily: 'NanumGothic', fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
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
                  side: BorderSide(color: const Color(0xff000000))),
              onPressed: () {
                Get.offAll(app_main());
              },
              padding: EdgeInsets.all(10.0),
              color: const Color(0xff000000),
              textColor: const Color(0xffffffff),
              child: Text("앱 메인으로", style: TextStyle(fontSize: 20)),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _progressView() {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              alignment: Alignment.center,
              height: 70.0,
              width: 70.0,
              child: CircularProgressIndicator(),
            ),
            new Text(
              '사진을 처리중입니다...\n1분 이상 소요될 수 있습니다.\n앱을 나가지 말고 기다려주세요.',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _postRequest(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _errorView();
          } else if (snapshot.hasData) {
            return _successView();
          } else {
            return _progressView();
          }
        });
  }
}
