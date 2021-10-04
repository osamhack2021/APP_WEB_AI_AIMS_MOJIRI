import 'package:aims/join/input_unitnum.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:get/get.dart';

class input_dognum extends StatefulWidget {
  @override
  _input_dognum createState() => _input_dognum();
}

class _input_dognum extends State<input_dognum> {
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
            Pin(size: 250.0, start: 36.0),
            Pin(size: 33.0, start: 63.0),
            child: Text(
              '군번을 입력해주세요',
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
              '회원가입을 진행합니다',
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
              controller: TextController,
              decoration: InputDecoration(
                labelText: '군번',
              ),
              textInputAction: TextInputAction.next,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return '군번을 입력하세요.';
                }
                return null;
              },
            ),
          ),
          Pinned.fromPins(
            Pin(start: 41.0, end: 43.0),
            Pin(size: 49.0, end: 48.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Get.toNamed("/input_unitnum", arguments: TextController.text);
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
