import 'dart:convert';

import 'package:aims/signup/pledge/pledge_1.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'input_dognum.dart';

Future<String> _postRequest(
    String dognum, String unitnum, String modelnum, String imeinum) async {
  Fluttertoast.showToast(
      msg: '서버에 요청',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);

  Map data = {
    "serial_num": dognum,
    "unit_num": unitnum,
    "model_num": modelnum,
    "imei_num": imeinum,
  };

  var body = json.encode(data);

  var response = await http.post(
      Uri.http('20.194.62.71', 'signUp'), // ex ) http://123.0.0.0/test
      headers: {"Content-Type": "application/json"},
      body: body);

  if (response.statusCode == 201 || response.statusCode == 200) {
    Fluttertoast.showToast(
        msg: 'response Body : ' + response.body + '서버통신양호 response 200, 201',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    var responseJson = json.decode(response.body);
    return responseJson;
  } else if (response.statusCode == 504) {
    Fluttertoast.showToast(
        msg: 'response Body : ' + response.body + '서버통신미흡 response 504',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    throw Exception('Failed to contect Server.');
  } else {
    Fluttertoast.showToast(
        msg: '코드 올바르지 않음.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    throw Exception('Failed to contect Server.');
  }
}

class Data {
  String rank;
  String name;

  Data(this.rank, this.name);

  factory Data.fromJson(dynamic json) {
    return Data(
      json['rank'] as String,
      json['name'] as String,
    );
  }
}

class chk_info extends StatefulWidget {
  @override
  _chk_info createState() => _chk_info();
}

class _chk_info extends State<chk_info> {
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
    return FutureBuilder<String>(
        future: _postRequest('${Get.arguments['dognum']}',
            '${Get.arguments['unitnum']}', '$_modelName', '$_imeiNo'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              '실패',
            );
          } else if (snapshot.hasData) {
            return Text(
              '성공',
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
