import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:flutter/rendering.dart';
import 'package:hand_signature/signature.dart';

HandSignatureControl control = new HandSignatureControl(
  threshold: 0.01,
  smoothRatio: 0.65,
  velocityRange: 2.0,
);

class signature extends StatefulWidget {
  @override
  _signature createState() => _signature();
}

class _signature extends State<signature> {
  GlobalKey _signaturePadKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
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
                color: const Color(0xffffffff),
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
            child: Stack(
              children: <Widget>[
                RepaintBoundary(
                  key: _signaturePadKey,
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    color: Colors.transparent,
                    child: HandSignaturePainterView(
                      control: control,
                      type: SignatureDrawType.shape,
                    ),
                  ),
                ),
                CustomPaint(
                  painter: DebugSignaturePainterCP(
                    control: control,
                    cp: false,
                    cpStart: false,
                    cpEnd: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 43.0),
            Pin(size: 49.0, end: 69.0),
            child: ElevatedButton(
              onPressed: () async {
                final RenderRepaintBoundary boundary =
                    _signaturePadKey.currentContext!.findRenderObject()!
                        as RenderRepaintBoundary;
                final ui.Image image = await boundary.toImage();
                ByteData? byteData =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                var pngBytes = byteData!.buffer.asUint8List();
                var bs64 = base64Encode(pngBytes);

                Get.toNamed("/chk_pledge", arguments: {
                  "name": '${Get.arguments['name']}',
                  "rank": '${Get.arguments['rank']}',
                  "dognum": '${Get.arguments['dognum']}',
                  "unitnum": '${Get.arguments['unitnum']}',
                  "bs64": bs64,
                });
              },
              style: ElevatedButton.styleFrom(
                primary:
                    const Color(0xffffffff), //change background color of button
                onPrimary:
                    const Color(0xff212121), //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 15.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  '서명 완료',
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
                control.clear();
              },
              child: Text("다시 서명하기"),
              style: TextButton.styleFrom(
                  primary: const Color(0xffffffff),
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
