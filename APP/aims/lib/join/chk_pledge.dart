import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:aims/join/pledge_text.dart';
import 'package:aims/login/login.dart';
import 'package:aims/join/signature.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:zoom_widget/zoom_widget.dart';

class chk_pledge extends StatefulWidget {
  @override
  _chk_pledge createState() => _chk_pledge();
}

class _chk_pledge extends State<chk_pledge> {
  GlobalKey globalKey = GlobalKey();

  Future<void> _capturePng() async {
    final RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    print(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 350.0, start: 36.0),
            Pin(size: 33.0, start: 63.0),
            child: Text(
              '작성한 보안서약서를 확인하세요',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(start: 120.0, end: 130.0),
            //넘겨받은 군번과 부대코드 다시 넘겨야함
            child: Zoom(
              maxZoomWidth: 1080,
              maxZoomHeight: 1920,
              child: RepaintBoundary(
                key: globalKey,
                child: pledge_text(
                  dognum: '군번',
                  unitnum: '부대코드',
                  bs64: '${Get.arguments}',
                ),
              ),
            ),
          ),

          //base64 인코딩 한 것   -   child: Text('${Get.arguments}'),

          Pinned.fromPins(
            Pin(start: 41.0, end: 41.0),
            Pin(size: 49.0, end: 69.0),
            child: ElevatedButton(
              onPressed: () async {
                final RenderRepaintBoundary boundary = globalKey.currentContext!
                    .findRenderObject()! as RenderRepaintBoundary;
                final ui.Image image = await boundary.toImage();
                ByteData? byteData =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                var pngBytes = byteData!.buffer.asUint8List();
                var bs64 = base64Encode(pngBytes);
                //다음페이지로 사진 bs64, 군번, 부대코드, 단말기 시리얼, imei까지 다같이 넘기기
              },
              style: ElevatedButton.styleFrom(
                primary:
                    const Color(0xff536349), //change background color of button
                onPrimary:
                    const Color(0xffffffff), //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 15.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  '네, 동의합니다',
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
                setState(() {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('정말 동의하지 않으시나요?'),
                      content: const Text('동의하지 않으시면 로그인 화면으로 되돌아갑니다.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('다시 생각해볼게요'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAll(() => login());
                          },
                          child: const Text('동의하지 않음'),
                        ),
                      ],
                    ),
                  );
                });
              },
              child: Text("아니오, 동의하지 않습니다"),
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
