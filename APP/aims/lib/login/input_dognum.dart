import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class input_dognum extends StatefulWidget {
  @override
  _input_dognum createState() => _input_dognum();
}

class _input_dognum extends State<input_dognum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 216.0, start: 36.0),
            Pin(size: 33.0, start: 63.0),
            child: Text(
              '군번을 입력해주세요',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 25,
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 192.0, start: 36.0),
            Pin(size: 17.0, start: 96.0),
            child: Text(
              '로그인 또는 회원가입을 진행합니다',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 13,
                color: const Color(0xff7e7e7e),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
              Pin(size: 215.0, start: 36.0), Pin(size: 33.0, middle: 0.1682),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '20-12345678',
                ),
              )),
          Pinned.fromPins(
            Pin(start: 41.0, end: 43.0),
            Pin(size: 49.0, end: 48.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffff9c9c),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 43.0),
            Pin(size: 49.0, end: 48.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "NanumGothic",
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffff6e6e))),
              child: Text("확인"),
            ),
          ),
        ],
      ),
    );
  }
}
