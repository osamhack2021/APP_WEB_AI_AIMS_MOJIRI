import 'dart:convert';

import 'package:aims/signup/pledge/pledge_1.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

String responsebody = 'true';

Future<String> _postRequest(String img64) async {
  Fluttertoast.showToast(
      msg: '서버에 요청',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);

  Map data = {"image": img64};

  var body = json.encode(data);

  var response = await http.post(
      Uri.http('20.194.62.71', 'pictures/create'), // ex ) http://123.0.0.0/test
      headers: {"Content-Type": "application/json"},
      body: body);

  if (response.statusCode == 201 || response.statusCode == 200) {
    Fluttertoast.showToast(
        msg: 'response Body : ' + response.body + '서버통신양호 response 200, 201',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
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

class _send_image extends State<send_image> {
  //응답 성공했을 때의 뷰
  //responsebody가 base64코드면 이미지를 보여주고 다운로드하게끔
  //responsebody가 'false'이면 이미지 처리 실패. 다시 촬영하게끔
  Widget _successView() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                '성공요',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ],
          ),
        ));
  }

  Widget _errorView() {
    //errorview를 띄우면서 카메라차단해야함
    return Padding(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              '에러뜸요',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ],
        )));
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
