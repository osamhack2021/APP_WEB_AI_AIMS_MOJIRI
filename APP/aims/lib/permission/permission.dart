import 'package:aims/join/input_dognum.dart';
import 'package:aims/login/login.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> _getStatus() async {
  Map<Permission, PermissionStatus> status =
      await [Permission.storage, Permission.camera].request();

  if (await Permission.camera.isGranted && await Permission.storage.isGranted) {
    return true;
  } else {
    return false;
  }
}

class permission extends StatefulWidget {
  @override
  _permission createState() => _permission();
}

class _permission extends State<permission> {
  permission() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 127.0, middle: 0.5),
            Pin(size: 127.0, start: 62.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/logo2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.1267, endFraction: 0.1267),
            Pin(size: 40.0, start: 189.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontSize: 14,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: '국군통합모바일보안체계 AIMS를 이용하기 위해\n',
                  ),
                  TextSpan(
                    text: '다음과 같은 권한을 허용해야 합니다',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, end: 35.0),
            Pin(size: 1.0, start: 254.5),
            child: SvgPicture.string(
              _svg_z2hybk,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, endFraction: 0.584),
            Pin(size: 23.0, start: 276.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontSize: 18,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: '·  카메라 ',
                  ),
                  TextSpan(
                    text: '(필수)',
                    style: TextStyle(
                      color: const Color(0xff536349),
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 60.0, endFraction: 0.0),
            Pin(size: 23.0, start: 474.0),
            child: Text(
              '푸시 알림을 보내기 위해 사용됩니다.',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 15,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 60.0, endFraction: 0.0),
            Pin(size: 23.0, start: 312.0),
            child: Text(
              '앱 내에서 사진 촬영을 위해 사용됩니다.',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 15,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 60.0, endFraction: 0.0),
            Pin(size: 23.0, start: 394.0),
            child: Text(
              '촬영한 사진을 저장하기 위해 사용됩니다.',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 15,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, end: 35.0),
            Pin(size: 1.0, start: 518.5),
            child: SvgPicture.string(
              _svg_mtbnsn,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, end: 35.0),
            Pin(size: 49.0, end: 48.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _getStatus().then((value) {
                    if (value == true) {
                      Get.off(() => login());
                    } else {}
                  });
                });
              },
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "NanumGothic",
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff536349))),
              child: Text("권한 확인"),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, endFraction: 0.3787),
            Pin(size: 23.0, start: 357.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontSize: 18,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: '·  사진 및 저장공간 ',
                  ),
                  TextSpan(
                    text: '(필수)',
                    style: TextStyle(
                      color: const Color(0xff536349),
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, endFraction: 0.4347),
            Pin(size: 23.0, start: 438.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'NanumGothic',
                  fontSize: 18,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: '·  휴대전화 권한 ',
                  ),
                  TextSpan(
                    text: '(필수)',
                    style: TextStyle(
                      color: const Color(0xff536349),
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_z2hybk =
    '<svg viewBox="35.0 219.5 305.0 1.0" ><path transform="translate(35.0, 219.49)" d="M 0 0 L 305 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mtbnsn =
    '<svg viewBox="35.0 483.5 305.0 1.0" ><path transform="translate(35.0, 483.51)" d="M 0 0 L 305 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
