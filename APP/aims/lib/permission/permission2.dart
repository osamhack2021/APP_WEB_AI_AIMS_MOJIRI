import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class permission2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 127.0, middle: 0.5017),
            Pin(size: 127.0, start: 63.0),
            child:
                // Adobe XD layer: 'splash_logo' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/splash_logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 35.0, end: 35.0),
            Pin(size: 46.0, middle: 0.217),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Hancom Gothic',
                  fontSize: 18,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: '국군통합모바일보안체계 AIMS를 이용하기 위해\n',
                  ),
                  TextSpan(
                    text: '다음과 같은 권한을 허용해야 합니다',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
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
            Pin(size: 1.0, middle: 0.2838),
            child: SvgPicture.string(
              _svg_rzkh8m,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 122.0, start: 35.0),
            Pin(size: 23.0, middle: 0.3189),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Hancom Gothic',
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
                      color: const Color(0xffff6e6e),
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
            Pin(size: 199.0, start: 35.0),
            Pin(size: 23.0, middle: 0.4109),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Hancom Gothic',
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
                      color: const Color(0xffff6e6e),
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
            Pin(size: 178.0, start: 35.0),
            Pin(size: 23.0, middle: 0.5028),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Hancom Gothic',
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
                      color: const Color(0xffff6e6e),
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
            Pin(start: 54.0, end: 6.0),
            Pin(size: 23.0, middle: 0.5338),
            child: Text(
              '푸시 알림을 보내기 위해 사용됩니다.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 54.0, end: 6.0),
            Pin(size: 23.0, middle: 0.3499),
            child: Text(
              '앱 내에서 사진 촬영을 위해 사용됩니다.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 54.0, end: 6.0),
            Pin(size: 23.0, middle: 0.4419),
            child: Text(
              '촬영한 사진을 저장하기 위해 사용됩니다.',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 34.0, end: 36.0),
            Pin(size: 1.0, middle: 0.5735),
            child: SvgPicture.string(
              _svg_vqtqv0,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 111.0, middle: 0.5016),
            Pin(size: 35.0, end: 64.0),
            child: Text(
              '권한 허용',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 26,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_rzkh8m =
    '<svg viewBox="35.0 262.5 358.0 1.0" ><path transform="translate(35.0, 262.5)" d="M 0 0 L 358 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vqtqv0 =
    '<svg viewBox="34.0 530.5 358.0 1.0" ><path transform="translate(34.0, 530.5)" d="M 0 0 L 358 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
