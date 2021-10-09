import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';

import 'join_2.dart';

class join_1 extends StatefulWidget {
  @override
  _join_1 createState() => _join_1();
}

class _join_1 extends State<join_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Pin(start: 38.0, end: 38.0),
            Pin(size: 45.0, middle: 0.7435),
            child: Text(
              'AIMS는 군 내에서 발생하는\n보안사고를 방지하기 위해서 만들어졌습니다',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 15,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 246.0, start: 40.0),
            Pin(size: 170.0, start: 67.0),
            child: Text(
              '왜\nAIMS를\n사용해야할까요?',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 33,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 175.0, middle: 0.5),
            Pin(size: 175.0, start: 300.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/question.png'),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 65.0, end: 35.0),
            Pin(size: 65.0, end: 35.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Get.to(join_2());
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('image/next.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
