import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:aims/join/input_unitnum.dart';
import 'package:aims/join/chk_pledge.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:flutter/rendering.dart';

class signature extends StatefulWidget {
  @override
  _signature createState() => _signature();
}

class _signature extends State<signature> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 250.0, start: 36.0),
            Pin(size: 33.0, start: 63.0),
            child: Text(
              '서명을 해주세요',
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
            Pin(size: 192.0, start: 38.0),
            Pin(size: 17.0, start: 100.0),
            child: Text(
              '서약서에 작성될 서명입니다',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 13,
                color: const Color(0xff7e7e7e),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 200.0, middle: 0.5),
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.grey[200],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 200.0, middle: 0.5),
            child: SfSignaturePad(
              key: _signaturePadKey,
              backgroundColor: Colors.transparent,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 43.0),
            Pin(size: 49.0, end: 69.0),
            child: ElevatedButton(
              onPressed: () async {
                ui.Image image = await _signaturePadKey.currentState!.toImage();
                ByteData? byteData =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                var pngBytes = byteData!.buffer.asUint8List();
                var bs64 = base64Encode(pngBytes);
                Get.toNamed('/chk_pledge', arguments: bs64);
              },
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "NanumGothic",
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff536349))),
              child: Text("서명 완료"),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 43.0),
            Pin(size: 49.0, end: 20.0),
            child: TextButton(
              onPressed: () {
                _signaturePadKey.currentState!.clear();
              },
              child: Text("다시 서명하기"),
              style: TextButton.styleFrom(
                  primary: const Color(0xff536349),
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
