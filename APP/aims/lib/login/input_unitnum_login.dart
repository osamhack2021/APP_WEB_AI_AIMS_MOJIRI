import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class input_unitnum extends StatefulWidget {
  @override
  _input_unitnum createState() => _input_unitnum();
}

class _input_unitnum extends State<input_unitnum> {
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
              '부대코드를 입력해주세요',
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
              '로그인을 진행합니다',
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
                  labelText: '부대코드',
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
            Pin(size: 40.0, middle: 0.5015),
            Pin(size: 27.0, end: 59.0),
            child: Text(
              '확인',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
