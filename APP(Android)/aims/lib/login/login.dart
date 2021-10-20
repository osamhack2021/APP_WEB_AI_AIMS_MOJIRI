import 'dart:convert';
import 'dart:async';

import 'package:aims/appmain/app_main.dart';
import 'package:aims/signup/join_1.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

String responsebody = 'true';
List<String>? info2;
List<String>? info;

Future<void> _postRequest(String dognum, String unitnum, String imeinum) async {
  Map data = {"serial_num": dognum, "unit_num": unitnum, "imei_num": imeinum};

  var body = json.encode(data);

  var response = await http.post(
      Uri.http('20.194.62.71', 'signIn'), // ex ) http://123.0.0.0/test
      headers: {"Content-Type": "application/json"},
      body: body);

  if (response.statusCode == 201 || response.statusCode == 200) {
    responsebody = response.body;
  } else if (response.statusCode == 504) {
    Fluttertoast.showToast(
        msg: 'response Body : ' + response.body + '서버통신미흡 response 504',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
    throw Exception('Failed to connect Server.');
  } else if (response.statusCode == 404) {
    responsebody = response.body;
    //throw Exception('Failed to connect Server.');
  } else {
    responsebody = response.body;
    //throw Exception('Failed to connect Server.');
  }
}

class login extends StatefulWidget {
  @override
  _login createState() => _login();
}

class _login extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _dog_num;
  var _unit_num;
  var bs64;
  final TextControllerDognum = TextEditingController();
  final TextControllerUnitnum = TextEditingController();
  late VideoPlayerController _controller;

  @override
  void dispose() {
    TextControllerDognum.dispose();
    TextControllerUnitnum.dispose();
    _controller.dispose();
    super.dispose();
  }

  String _imeiNo = "", _modelName = "", _deviceName = "", _productName = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _controller = VideoPlayerController.asset("image/main_video.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Container(color: Colors.black.withAlpha(40)),
          Pinned.fromPins(
            Pin(size: 150.0, middle: 0.5),
            Pin(size: 150.0, start: 62.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/logo_white_kor.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 40.0, start: 250.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: TextControllerDognum,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade800,
                hintText: '군번',
                hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.6,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 40.0, start: 300.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: TextControllerUnitnum,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade800,
                hintText: '부대코드',
                hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.6,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade800),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 49.0, start: 380.0),
            child: ElevatedButton(
              onPressed: () async {
                await _postRequest(TextControllerDognum.text,
                    TextControllerUnitnum.text, '$_imeiNo');
                if (responsebody == 'User is not exist') {
                  Fluttertoast.showToast(
                      msg: '군번 또는 부대코드가 잘못되었거나 다른 기기로 로그인하셨습니다.',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (responsebody == 'Device is not exist') {
                  Fluttertoast.showToast(
                      msg: '다른 기기로 가입된 정보가 존재합니다.\n다시 가입해 주세요.',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  Get.to(app_main());
                }
              },
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 20,
                    color: const Color(0xff000000),
                    fontFamily: "NanumGothic",
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffffffff))),
              child: Text(
                '로그인',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xff000000),
                  fontFamily: "NanumGothic",
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, end: 35.0),
            Pin(size: 20.0, start: 450.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontSize: 15,
                  color: const Color(0xffffffff),
                ),
                children: [
                  TextSpan(
                    text: '처음 사용하신다면 ',
                  ),
                  TextSpan(
                    text: '회원가입',
                    style: TextStyle(
                      color: Colors.blue[100],
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(join_1());
                      },
                  ),
                  TextSpan(
                    text: ' 하기',
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
