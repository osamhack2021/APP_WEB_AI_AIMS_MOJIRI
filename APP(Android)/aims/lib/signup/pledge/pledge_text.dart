import 'dart:convert';
import 'dart:io';

import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:device_information/device_information.dart';

class pledge_text extends StatefulWidget {
  final String name;
  final String rank;
  final String dognum;
  final String unitnum;
  final String bs64;
  const pledge_text(
      {Key? key,
      required this.name,
      required this.rank,
      required this.dognum,
      required this.unitnum,
      required this.bs64})
      : super(key: key);

  @override
  _pledge_text createState() => _pledge_text();
}

class _pledge_text extends State<pledge_text> {
  var now = DateTime.now();
  String _imeiNo = "", _modelName = "", _deviceName = "", _productName = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    late String imeiNo = '', modelName = '', deviceName = '', productName = '';

    try {
      imeiNo = await DeviceInformation.deviceIMEINumber;
      modelName = await DeviceInformation.deviceModel;
      deviceName = await DeviceInformation.deviceName;
      productName = await DeviceInformation.productName;
    } on PlatformException catch (e) {
      imeiNo = '${e.message}';
    }

    if (!mounted) return;

    setState(() {
      _imeiNo = imeiNo;
      _modelName = modelName;
      _deviceName = deviceName;
      _productName = productName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 65.0, end: 65.0),
            Pin(size: 60.0, start: 41.0),
            child: Text(
              '개인 상용 정보통신장비 반입·운용간 보안서약서',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 45,
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 59.0, end: 59.0),
            Pin(start: 117.0, end: 68.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: const Color(0xff000000)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 59.5, end: 58.5),
            Pin(size: 1.0, end: 161.5),
            child: SvgPicture.string(
              _svg_io8az,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 80.0, end: 69.0),
            Pin(size: 1200.0, middle: 0.3154),
            child: Text(
              '본인은 ${now.year}년 ${now.month}월 ${now.day}일부로 개인용 상용 정보통신장비를\n영내에 반입하여 운용함에 있어 다음 사항을 준수할 것을 서약합니다.\n\n1. 개인용 상용 정보통신장비를 영내 반입함에 있어 다음 사항을 준수한다.\n   가. 문자 및 그림, 영상 등을 저장·촬영·전송·영상통화 및 모바일\n       인터넷을 할 수 있는 장비를 영내 반입 시 보안담당관에게 등록\n   나. 등록번호를 장비에 부착\n\n 2. 개인용 상용정보통신장비를 운용함에 있어 다음 사항을 준수한다.\n   가. 군사기밀 또는 민감한 군사사항 통화 금지\n   나. 군사사항을 입력, 저장, 촬영 및 전송 금지\n   다. 업무용 PC(국방망, 인터넷 등)에 접속 금지\n   라. 군사통제구역, 비밀작업실 및 비밀회의장 등 보안규정에 명시된 \n      시설에 반입금지\n   마. 군사보호구역 내에서 모바일인터넷·사진촬영·녹음·화상통화 금지\n   바. 본인(가족) 명의의 핸드폰만 반입하여 사용\n   사. 차량용 블랙박스 사용에 따른 보안대책 철저히 준수\n      1) 주기적인 저장 영상 삭제 및 교통사고시 부대관련 영상 확인/제거 후 제공\n       2) 부대 관련 영상을 인터넷이 연결된 PC내 저장 금지\n       3) 입영 시 블랙박스 촬영금지 조치 및 퇴영 시 블랙박스 촬영 조치\n       4)스마트폰용 블랙박스 앱 사용 시에도 블랙박스 보안대책 준수\n\n 3. 홍보를 목적으로 상용 정보통신장비를 이용할 경우 ‘국방홍보훈령’과  \n    ‘SNS 보안지침’ 및 ‘SNS 가이드라인’을 준수한다.\n\n 4. 정기/수시 보안감사 및 부대 계획에 의거 실시하는 보안점검, 군사기밀\n    유출 사고조사 과정에서 군사기밀 유출 원인 파악을 위한 필요성과\n    상당성이 인정되는 경우 보안검사(점검), 조사에 적극 협조한다.\n\n 5. 장비명 / 기종 : $_productName, $_modelName',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 27,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          /*본인은 ${now.year}년 ${now.month}월 ${now.day}일부로 개인용 상용 정보통신장비를\n영내에 반입하여 운용함에 있어 다음 사항을 준수할 것을 서약합니다.\n\n1. 개인용 상용 정보통신장비를 영내 반입함에 있어 다음 사항을 준수한다.\n   가. 문자 및 그림, 영상 등을 저장·촬영·전송·영상통화 및 모바일\n       인터넷을 할 수 있는 장비를 영내 반입 시 보안담당관에게 등록\n   나. 등록번호를 장비에 부착\n\n 2. 개인용 상용정보통신장비를 운용함에 있어 다음 사항을 준수한다.\n   가. 군사기밀 또는 민감한 군사사항 통화 금지\n   나. 군사사항을 입력, 저장, 촬영 및 전송 금지\n   다. 업무용 PC(국방망, 인터넷 등)에 접속 금지\n   라. 군사통제구역, 비밀작업실 및 비밀회의장 등 보안규정에 명시된 \n      시설에 반입금지\n   마. 군사보호구역 내에서 모바일인터넷·사진촬영·녹음·화상통화 금지\n   바. 본인(가족) 명의의 핸드폰만 반입하여 사용\n   사. 차량용 블랙박스 사용에 따른 보안대책 철저히 준수\n      1) 주기적인 저장 영상 삭제 및 교통사고시 부대관련 영상 확인/제거 후 제공\n       2) 부대 관련 영상을 인터넷이 연결된 PC내 저장 금지\n       3) 입영 시 블랙박스 촬영금지 조치 및 퇴영 시 블랙박스 촬영 조치\n       4)스마트폰용 블랙박스 앱 사용 시에도 블랙박스 보안대책 준수\n\n 3. 홍보를 목적으로 상용 정보통신장비를 이용할 경우 ‘국방홍보훈령’과  \n    ‘SNS 보안지침’ 및 ‘SNS 가이드라인’을 준수한다.\n\n 4. 정기/수시 보안감사 및 부대 계획에 의거 실시하는 보안점검, 군사기밀\n    유출 사고조사 과정에서 군사기밀 유출 원인 파악을 위한 필요성과\n    상당성이 인정되는 경우 보안검사(점검), 조사에 적극 협조한다.\n\n 5. 장비명 / 기종 : ${_deviceData['brand']}, ${_deviceData['model']}*/

          Pinned.fromPins(
            Pin(size: 250.0, middle: 0.529),
            Pin(size: 36.0, end: 187.0),
            child: Text(
              '${now.year}년 ${now.month}월 ${now.day}일',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 27,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.088, endFraction: 0.088),
            Pin(size: 36.0, end: 102.0),
            child: Text(
              '서약자      계급   ${widget.rank}     군번   ${widget.dognum}      성명   ${widget.name}         (서명)',
              style: TextStyle(
                fontFamily: 'NanumGothic',
                fontSize: 27,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 100.0, end: 110.0),
            Pin(size: 200.0, end: 10.0),
            child: Image.memory(
              const Base64Codec().decode(widget.bs64),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_io8az =
    '<svg viewBox="59.5 1757.5 962.0 1.0" ><path transform="translate(59.5, 1757.5)" d="M 0 0 L 962 0" fill="none" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
