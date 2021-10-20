import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'input_dognum.dart';

String? responsebody;
List<String>? info2;
List<String>? info;

String findUnit(String unitnum) {
  if (unitnum == '0192') {
    return '국직 국직부대 국군지휘통신사령부 사이버네트워크작전센터 작전대';
  } else if (unitnum == '0134') {
    return '국직 국직부대 계룡대근무지원단 관리대대';
  } else if (unitnum == '3100') {
    return '육군 육군본부';
  } else if (unitnum == '3528') {
    return '육군 특수전사령부 123정보통신단 1대대';
  } else if (unitnum == '3801') {
    return '육군 지상작전사령부 제7기동군단';
  } else if (unitnum == '3819') {
    return '육군 지상작전사령부 제7기동군단 제 11기동사단 정보통신대대';
  } else if (unitnum == '3123') {
    return '육군 지상작전사령부 제3군단 제 20기갑여단 59전차대대';
  } else if (unitnum == '5103') {
    return '해군 해군작전사령부 제2함대 지휘통신대대';
  } else if (unitnum == '7531') {
    return '공군 공군작전사령부 제5공중기동비행단 작전지원전대 정보통신대대';
  } else {
    return 'null';
  }
}

Future<String> _postRequest(String dognum, String unitnum) async {
  Map data = {
    "serial_num": dognum,
    "unit_num": unitnum,
  };

  var body = json.encode(data);

  var response = await http.post(
      Uri.http('20.194.62.71', 'findInfo'), // ex ) http://123.0.0.0/test
      headers: {"Content-Type": "application/json"},
      body: body);

  if (response.statusCode == 201 || response.statusCode == 200) {
    responsebody = response.body;
    info = responsebody!.split("\"");
    info2 = [info![7], " ", info![3]];
    responsebody = info2!.join();
    return response.body;
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
        msg: 'badgate',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
    throw Exception('Failed to contect Server.');
  }
}

class chk_info extends StatefulWidget {
  @override
  _chk_info createState() => _chk_info();
}

class _chk_info extends State<chk_info> {
  Widget _errorView() {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 196.0, middle: 0.5028),
            Pin(size: 54.0, middle: 0.4),
            child: Text(
              '일치하는 정보가 없습니다.\n다시 입력해주세요.',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
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
                    side: BorderSide(color: const Color(0xffffffff))),
                onPressed: () {
                  Get.to(input_dognum());
                },
                padding: EdgeInsets.all(10.0),
                color: const Color(0xffffffff),
                textColor: const Color(0xff212121),
                child: Text("확인", style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _successView() {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: Stack(children: <Widget>[
        Pinned.fromPins(
          Pin(start: 38.0, end: 38.0),
          Pin(start: 150.0, size: 100.0),
          child: Text(
            '$responsebody',
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'NanumGothic',
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
              color: Colors.white,
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 38.0, end: 38.0),
          Pin(start: 250.0, size: 100.0),
          child: Text(
            findUnit('${Get.arguments['unitnum']}'),
            style: TextStyle(
                fontFamily: 'NanumGothic', fontSize: 16, color: Colors.white70),
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
                  side: BorderSide(color: const Color(0xffffffff))),
              onPressed: () {
                Get.toNamed("/pledge_1", arguments: {
                  "name": '${info![3]}',
                  "rank": '${info![7]}',
                  "dognum": '${Get.arguments['dognum']}',
                  "unitnum": '${Get.arguments['unitnum']}',
                });
              },
              padding: EdgeInsets.all(10.0),
              color: const Color(0xffffffff),
              textColor: const Color(0xff212121),
              child: Text("확인", style: TextStyle(fontSize: 20)),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _progressView() {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _postRequest(
            '${Get.arguments['dognum']}', '${Get.arguments['unitnum']}'),
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
