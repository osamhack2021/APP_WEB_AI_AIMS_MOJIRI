import 'package:aims/signup/input_dognum.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';

class join_2 extends StatefulWidget {
  @override
  _join_2 createState() => _join_2();
}

class _join_2 extends State<join_2> {
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
            Pin(start: 40.0, end: 16.0),
            Pin(size: 220.0, start: 67.0),
            child: Text(
              '또한,\nAIMS는\n군 장병들의\n잃어버린 권리를\n찾기위해 노력했습니다',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 25,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 65.0, end: 35.0),
            Pin(size: 65.0, end: 35.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Get.to(input_dognum());
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
          Pinned.fromPins(
            Pin(size: 554.2, middle: 0.2486),
            Pin(size: 554.2, end: 62.4),
            child: Transform.rotate(
              angle: -0.0698,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('image/test2.png'),
                    fit: BoxFit.fill,
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
