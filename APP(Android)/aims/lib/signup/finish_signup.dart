import 'dart:convert';

import 'package:aims/login/login.dart';
import 'package:aims/signup/pledge/pledge_3.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';

class finish_signup extends StatefulWidget {
  @override
  _finish_signup createState() => _finish_signup();
}

class _finish_signup extends State<finish_signup> {
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
            Pin(size: 210.0, middle: 0.503),
            Pin(size: 81.0, start: 109.0),
            child: Text(
              '가입신청이\n완료되었습니다',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 30,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 196.0, middle: 0.5028),
            Pin(size: 54.0, middle: 0.5),
            child: Text(
              '보안담당관의 승인 후\n로그인 할 수 있습니다',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 41.0),
            Pin(size: 49.0, end: 35.0),
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(() => login());
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
                  '로그인 하러가기',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NanumGothic",
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
