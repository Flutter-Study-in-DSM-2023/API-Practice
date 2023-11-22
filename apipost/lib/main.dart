import 'package:apipost/secret.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'http/login_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              //속성, 버튼을 누르면 함수 호출
              setState(() {
                login(Id, pw);
              });
            },
            child: Text('로그인'),
          ),
        ),
      ),
    );
  }
}

Future<LoginModel> login(String accountId, String password) async {
  final Map<String, dynamic> requestData = {
    "account_id": accountId,
    "password": password,
    "device_token": "",
  };

  final response = await http.post(
    Uri.parse("https://prod-server.xquare.app/users/login"),
    //http.post 메서드에 전달되는 요청 URL을 생성
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    print(response.statusCode);
    print(response.body);
  }
  final Map<String, dynamic> responseData = jsonDecode(response.body);
  return LoginModel.fromJson(responseData);
}
