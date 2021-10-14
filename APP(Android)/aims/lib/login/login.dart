import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:aims/appmain/app_main.dart';
import 'package:aims/login/validator.dart';
import 'package:aims/appmain/camera.dart';
import 'package:aims/signup/join_1.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:aims/login/validator.dart';

class login extends StatefulWidget {
  @override
  _login createState() => _login();
}

class _login extends State<login> with Validator {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _dog_num;
  var _unit_num;
  var bs64;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 150.0, middle: 0.5),
            Pin(size: 150.0, start: 62.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/logo3.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 40.0, start: 250.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '군번',
              ),
              validator: (value) {
                if (value!.length < 1) {
                  return '군번을 입력하세요';
                }
                return null;
              },
              onSaved: (value) {
                _dog_num = value;
              },
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 40.0, start: 310.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '부대코드',
              ),
              validator: (value) {
                if (value!.isEmpty)
                  return '부대코드를 입력하세요.';
                else
                  return null;
              },
              onSaved: (value) {
                _unit_num = value;
              },
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 49.0, start: 380.0),
            child: ElevatedButton(
              key: _formKey,
              onPressed: () {
                Get.to(app_main());
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "NanumGothic",
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff536349))),
              child: Text("로그인"),
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
                  color: const Color(0xff707070),
                ),
                children: [
                  TextSpan(
                    text: '처음 사용하신다면 ',
                  ),
                  TextSpan(
                    text: '회원가입',
                    style: TextStyle(
                      color: const Color(0xff00b1ff),
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
