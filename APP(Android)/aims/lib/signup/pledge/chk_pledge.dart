import 'dart:convert';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:aims/signup/pledge/pledge_text.dart';
import 'package:aims/login/login.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

Future<void> _postRequest(String name, String dognum, String unitnum,
    String modelnum, String imeinum, String pledge) async {
  Map data = {
    "name": name,
    "serial_num": dognum,
    "unit_num": unitnum,
    "pledge": pledge,
    "model_num": modelnum,
    "imei_num": imeinum,
    "camera_active": true,
  };

  var body = json.encode(data);

  var response = await http.post(
      Uri.http('20.194.62.71', 'signUp'), // ex ) http://123.0.0.0/test
      headers: {"Content-Type": "application/json"},
      body: body);

  if (response.statusCode == 201 || response.statusCode == 200) {
    //return _getJson.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 504) {
    Fluttertoast.showToast(
        msg: 'response Body : ' + response.body + '서버통신미흡 response 504',
        toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0);
    throw Exception('Failed to contect Server.');
  } else {
    Fluttertoast.showToast(
        msg: '코드 올바르지 않음.',
        toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0);
    throw Exception('Failed to contect Server.');
  }
}

class chk_pledge extends StatefulWidget {
  @override
  _chk_pledge createState() => _chk_pledge();
}

class _chk_pledge extends State<chk_pledge> {
  GlobalKey globalKey = GlobalKey();
  String _imeiNo = "", _modelName = "", _deviceName = "", _productName = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    late String imeiNo = '', modelName = '', deviceName = '', productName = '';

    try {
      imeiNo = await DeviceInformation.deviceIMEINumber;
      modelName = await DeviceInformation.deviceModel;
      deviceName = await DeviceInformation.deviceName;
      productName = await DeviceInformation.productName;
    } on PlatformException catch (e) {
      imeiNo = '${e.message}';
    }

    if (!mounted) return;

    setState(() {
      _imeiNo = imeiNo;
      _modelName = modelName;
      _deviceName = deviceName;
      _productName = productName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 350.0, start: 36.0),
            Pin(size: 33.0, start: 63.0),
            child: Text(
              '작성한 보안서약서를 확인하세요',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(start: 120.0, end: 130.0),
            //넘겨받은 군번과 부대코드 다시 넘겨야함
            child: Zoom(
              maxZoomWidth: 1080,
              maxZoomHeight: 1920,
              child: RepaintBoundary(
                key: globalKey,
                child: pledge_text(
                  name: '${Get.arguments['name']}',
                  rank: '${Get.arguments['rank']}',
                  dognum: '${Get.arguments['dognum']}',
                  unitnum: '${Get.arguments['unitnum']}',
                  bs64: '${Get.arguments['bs64']}',
                ),
              ),
            ),
          ),

          Pinned.fromPins(
            Pin(start: 41.0, end: 41.0),
            Pin(size: 49.0, end: 69.0),
            child: ElevatedButton(
              onPressed: () async {
                final RenderRepaintBoundary boundary = globalKey.currentContext!
                    .findRenderObject()! as RenderRepaintBoundary;
                final ui.Image image = await boundary.toImage();
                ByteData? byteData =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                var pngBytes = byteData!.buffer.asUint8List();
                var bs64 = base64Encode(pngBytes);
                setState(() async {
                  _postRequest(
                      '${Get.arguments['name']}',
                      '${Get.arguments['dognum']}',
                      '${Get.arguments['unitnum']}',
                      '$_modelName',
                      '$_imeiNo',
                      bs64);
                });
                //다음페이지로 사진 bs64, 군번, 부대코드, imei까지 다같이 넘기기(finish_signup.dart)
                Get.toNamed("/finish_signup");
              },
              style: ElevatedButton.styleFrom(
                primary:
                    const Color(0xffffffff), //change background color of button
                onPrimary:
                    const Color(0xff212121), //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 15.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  '네, 동의합니다',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NanumGothic",
                  ),
                ),
              ),
            ),
          ),
          //alerdialog 실행시 보안서약서 안보이는 오류있음. 수정필

          Pinned.fromPins(
            Pin(start: 41.0, end: 43.0),
            Pin(size: 49.0, end: 20.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('동의하지 않았습니다.'),
                      content: const Text('로그인 화면으로 되돌아갑니다.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Get.offAll(() => login());
                          },
                          child: const Text('확인'),
                        ),
                      ],
                    ),
                  );
                });
              },
              child: Text("아니오, 동의하지 않습니다"),
              style: TextButton.styleFrom(
                  primary: const Color(0xffffffff),
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: "NanumGothic",
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
