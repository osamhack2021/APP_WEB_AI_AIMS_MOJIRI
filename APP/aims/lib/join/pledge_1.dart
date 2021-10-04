import 'package:aims/join/input_unitnum.dart';
import 'package:aims/login/login.dart';
import 'package:aims/join/pledge_2.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class pledge_1 extends StatefulWidget {
  @override
  _pledge_1 createState() => _pledge_1();
}

class _pledge_1 extends State<pledge_1> {
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
              '보안서약서 작성',
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
              '아래 사항에 동의하시나요?',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 13,
                color: const Color(0xff7e7e7e),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 20.0),
            Pin(size: 300.0, start: 170.0),
            child: Text(
              '1. 개인용 상용 정보통신장비를 영내 반입함에 있어 다음 사항을 준수한다.\n가. 문자 및 그림, 영상 등을 저장·촬영·전송·영상통화 및 모바일\n인터넷을 할 수 있는 장비를 영내 반입 시 보안담당관에게 등록\n나. 등록번호를 장비에 부착',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 13,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 41.0),
            Pin(size: 49.0, end: 69.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(pledge_2());
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
