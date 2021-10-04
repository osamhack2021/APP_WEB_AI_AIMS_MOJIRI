import 'package:aims/join/input_unitnum.dart';
import 'package:aims/login/login.dart';
import 'package:aims/join/pledge_3.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class pledge_2 extends StatefulWidget {
  @override
  _pledge_2 createState() => _pledge_2();
}

class _pledge_2 extends State<pledge_2> {
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
            Pin(size: 450.0, start: 170.0),
            child: Text(
              '2. 개인용 상용정보통신장비를 운용함에 있어 다음 사항을 준수한다.\n가. 군사기밀 또는 민감한 군사사항 통화 금지\n나. 군사사항을 입력, 저장, 촬영 및 전송 금지\n다. 업무용 PC(국방망, 인터넷 등)에 접속 금지\n라. 군사통제구역, 비밀작업실 및 비밀회의장 등 보안규정에 명시된 시설에 반입금지\n마. 군사보호구역 내에서 모바일인터넷·사진촬영·녹음·화상통화 금지\n바. 본인(가족) 명의의 핸드폰만 반입하여 사용\n사. 차량용 블랙박스 사용에 따른 보안대책 철저히 준수\n1)주기적인 저장 영상 삭제 및 교통사고시 부대관련 영상 확인/제거 후 제공\n2) 부대 관련 영상을 인터넷이 연결된 PC내 저장 금지\n3) 입영 시 블랙박스 촬영금지 조치 및 퇴영 시 블랙박스 촬영 조치\n4)스마트폰용 블랙박스 앱 사용 시에도 블랙박스 보안대책 준수',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 11,
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
                Get.to(pledge_3());
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
