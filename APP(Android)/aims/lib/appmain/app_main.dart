import 'package:aims/appmain/camera.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class app_main extends StatefulWidget {
  @override
  _app_main createState() => _app_main();
}

class _app_main extends State<app_main> {
  bool? CameraActive;

  static const MethodChannel _channel =
      const MethodChannel('com.example.aims/camera');

  Future<void> disableCamera() async {
    await _channel.invokeMethod('setDisableCamera');
  }

  void enableCamera() {
    _channel.invokeMethod('setEnableCamera');
  }

  Future<void> disableCameraFinishTaking() async {
    await _channel.invokeMethod('setDisableCameraFinishTaking');
  }

  Future<bool> getCameraDisabled() async {
    return await _channel.invokeMethod('getCameraDisabled');
  }

  Future<bool> setUsbEnable() async {
    return await _channel.invokeMethod('setUsbEnable');
  }

  @override
  Future<void> initState() async {
    super.initState();
    initPlatformState();
    CameraActive = await getCameraDisabled();
  }

  Future<void> initPlatformState() async {
    await disableCamera();
    await setUsbEnable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 80.0, end: 80.0),
            Pin(size: 60.0, start: 24.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/main_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 64.0, middle: 0.5),
            Pin(size: 20.0, start: 115.0),
            child: Text(
              '계급 성명',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, middle: 0.5),
            Pin(size: 20.0, start: 90.0),
            child: Text(
              '소속',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 137.0, middle: 0.5),
            Pin(size: 137.0, middle: 0.4074),
            child: mainImage(),
          ),
          Pinned.fromPins(
            Pin(start: 62.0, end: 62.0),
            Pin(size: 51.0, middle: 0.594),
            child: ElevatedButton(
              onPressed: () async {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('경고'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        content: const Text(
                            '촬영, 이미지 처리 도중 앱을 강제로 나가면 카메라 기능은 자동으로 차단되며 앱이 종료됩니다. 유념하여 주시길 바랍니다.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Get.to(Takecamera());
                            },
                            child: const Text('확인'),
                          ),
                        ],
                      );
                    });
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
                  '사진 촬영하기',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "NanumGothic",
                  ),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 188.0, middle: 0.5027),
            Pin(size: 33.0, middle: 0.2734),
            child: Text(
              '보안기능 동작 중',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 25,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.5, end: -0.5),
            Pin(size: 1.0, middle: 0.2226),
            child: SvgPicture.string(
              _svg_uxk4j4,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 1.0, middle: 0.7084),
            child: SvgPicture.string(
              _svg_yfxa,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 57.0, middle: 0.195),
            Pin(size: 57.0, middle: 0.836),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/usb.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 57.0, middle: 0.5),
            Pin(size: 57.0, middle: 0.836),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/camera.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 57.0, middle: 0.805),
            Pin(size: 57.0, middle: 0.836),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('image/manage.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 112.0, middle: 0.5019),
            Pin(size: 20.0, end: 52.0),
            child: Text(
              'FAQ   |  공지사항  |  차단해제',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 208.0, middle: 0.503),
            Pin(size: 20.0, end: 16.0),
            child: Text(
              '국군통합모바일보안체계 v0.0.0',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Container mainImage() {
    if (CameraActive == true) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('image/unlock.png'),
            fit: BoxFit.contain,
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('image/lock.png'),
            fit: BoxFit.contain,
          ),
        ),
      );
    }
  }
}

const String _svg_uxk4j4 =
    '<svg viewBox="0.5 180.5 375.0 1.0" ><path transform="translate(0.5, 180.5)" d="M 0 0 L 375 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yfxa =
    '<svg viewBox="0.0 574.5 375.0 1.0" ><path transform="translate(0.0, 574.5)" d="M 0 0 L 375 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
