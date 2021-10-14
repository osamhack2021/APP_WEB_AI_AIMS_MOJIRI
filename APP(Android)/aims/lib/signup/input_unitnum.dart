import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';

class input_unitnum extends StatefulWidget {
  @override
  _input_unitnum createState() => _input_unitnum();
}

class _input_unitnum extends State<input_unitnum> {
  final TextController = TextEditingController();

  @override
  void dispose() {
    TextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 300.0, start: 36.0),
            Pin(size: 33.0, start: 63.0),
            child: Text(
              '부대코드를 입력해주세요',
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
            Pin(size: 300.0, start: 38.0),
            Pin(size: 17.0, start: 96.0),
            child: Text(
              '모르겠다면 보안담당관에게 문의하세요',
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
            Pin(size: 55.0, start: 130.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: '부대코드',
              ),
              textInputAction: TextInputAction.next,
              controller: TextController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return '부대코드를 입력하세요.';
                }
                return null;
              },
            ),
          ),
          Pinned.fromPins(
            Pin(start: 38.0, end: 38.0),
            Pin(size: 49.0, end: 48.0),
            child: ElevatedButton(
              onPressed: () {
                //입력한 군번과 부대코드에 일치하는 정보 있는지 확인 후 라우트
                Get.toNamed("/chk_info", arguments: {
                  "dognum": '${Get.arguments}',
                  "unitnum": TextController.text
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
              child: Text("확인"),
            ),
          ),
        ],
      ),
    );
  }
}
