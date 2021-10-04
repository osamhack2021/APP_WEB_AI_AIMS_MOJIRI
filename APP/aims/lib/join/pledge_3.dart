import 'package:aims/join/input_unitnum.dart';
import 'package:aims/login/login.dart';
import 'package:aims/join/signature.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class pledge_3 extends StatefulWidget {
  @override
  _pledge_3 createState() => _pledge_3();
}

class _pledge_3 extends State<pledge_3> {
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
              '3. 홍보를 목적으로 상용 정보통신장비를 이용할 경우 ‘국방홍보훈령’과\n‘SNS 보안지침’ 및 ‘SNS 가이드라인’을 준수한다.\n\n4. 정기/수시 보안감사 및 부대 계획에 의거 실시하는 보안점검, 군사기밀\n유출 사고조사 과정에서 군사기밀 유출 원인 파악을 위한 필요성과\n상당성이 인정되는 경우 보안검사(점검), 조사에 적극 협조한다.',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 12,
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
                setState(() {
                  Get.to(signature());
                });
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
