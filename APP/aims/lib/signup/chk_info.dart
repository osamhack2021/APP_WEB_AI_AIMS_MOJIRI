import 'dart:convert';

import 'package:aims/signup/pledge/pledge_1.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'input_dognum.dart';

class Data {
  String team;
  String rank;
  String name;

  Data(this.team, this.rank, this.name);

  factory Data.fromJson(dynamic json) {
    return Data(
      json['team'] as String,
      json['rank'] as String,
      json['name'] as String,
    );
  }

  @override
  String toString() {
    return '{${this.team}, ${this.rank}, ${this.name}, }';
  }
}

class chk_info extends StatefulWidget {
  @override
  _chk_info createState() => _chk_info();
}

class _chk_info extends State<chk_info> {
  /* get data for http
  how to use?
  data.team, data.rank 이런식으로..
  

  var _text = "Http Parsing";
  List<Data> _datas = [];

  void _fetchPosts() async {
    final response = await http.get("");
    _text = utf8.decode(response.bodyBytes);
    var dataObjsJson = jsonDecode(_text)['data'] as List;
    final List<Data> parsedResponse =
        dataObjsJson.map((dataJson) => Data.fromJson(dataJson)).toList();
    setState(() {
      _datas.clear();
      _datas.addAll(parsedResponse);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffe6ffd7),
                  Color(0xff536349),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 30.0, end: 30.0),
            Pin(size: 40.0, start: 121.0),
            child: Text(
              '본인의 신분과 일치하나요?',
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
            Pin(size: 300.0, middle: 0.5034),
            Pin(size: 100.0, middle: 0.5),
            child: Text(
              //추후 입력받은 군번과 부대코드로 조회 후 변경해주어야 함.
              '소속 : 제 11기동사단 정보통신대대\n\n계급 : 상병\n\n이름 : 김시원',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 15,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 41.0),
            Pin(size: 49.0, end: 69.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Get.toNamed("/pledge_1", arguments: {
                  "dognum": '${Get.arguments['dognum']}',
                  "unitnum": '${Get.arguments['unitnum']}',
                });
                });
              },
              style: ElevatedButton.styleFrom(
                primary:
                    const Color(0xffffffff), //change background color of button
                onPrimary:
                    const Color(0xff536349), //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 15.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  '네, 맞아요',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NanumGothic",
                  ),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 43.0),
            Pin(size: 49.0, end: 20.0),
            child: TextButton(
              onPressed: () {
                Get.off(() => input_dognum());
              },
              child: Text("아니오, 다시 입력할게요"),
              style: TextButton.styleFrom(
                  primary: Colors.white,
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
