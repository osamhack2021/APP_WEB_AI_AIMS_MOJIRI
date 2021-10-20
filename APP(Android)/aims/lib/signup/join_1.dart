import 'package:aims/signup/input_dognum.dart';
import 'package:aims/signup/pledge/signature.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';

class join_1 extends StatefulWidget {
  @override
  _join_1 createState() => _join_1();
}

class _join_1 extends State<join_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Stack(children: <Widget>[
        Positioned(
          top: 0.0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('image/joinpage.png'),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('image/joinpage.png'),
              ),
            ),
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
              child: Text("시작하기", style: TextStyle(fontSize: 20)),
            ),
          ),
        ),
      ]),
    );
  }
}
