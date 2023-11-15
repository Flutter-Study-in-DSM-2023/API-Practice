import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hhttp/url.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Model>? future;

  @override
  void initState() {
    super.initState();
    //future = getStatus();
    future = getStatusDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<Model>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.title.toString()),
                      Text(snapshot.data!.id.toString()),
                      Text(snapshot.data!.userId.toString()),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString()); // ('${snapshot.error}')
                }

                return const CircularProgressIndicator();
              },
            ),
            ElevatedButton(
              onPressed: () async {
                postLoginInfo(id, pwd);
              },
              child: Text(
                'http post',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Model {
  int? userId;
  int? id;
  String? title;

  Model({this.userId, this.id, this.title});

  Model.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

Future<Model> getStatus() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'));
  if (response.statusCode == 200) {
    return Model.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('값을 받아오지 못함.');
  }
}

Future<Model> getStatusDio() async {
  Dio dio = Dio();
  final response =
      await dio.get('https://jsonplaceholder.typicode.com/albums/1');
  if (response.statusCode == 200) {
    return Model.fromJson(response.data);
  } else {
    throw Exception('값을 받아오지 못함.');
  }
}

class LoginResponse {
  TokenResponse? tokenResponse;
  String? message;

  LoginResponse({this.tokenResponse, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    tokenResponse = json['tokenResponse'] != null
        ? TokenResponse.fromJson(json['tokenResponse'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tokenResponse != null) {
      data['tokenResponse'] = tokenResponse!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class TokenResponse {
  String? accessToken;
  String? refreshToken;

  TokenResponse({this.accessToken, this.refreshToken});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

Future<LoginResponse> postLoginInfo(String accountId, String password) async {
  Map<String, dynamic> data = {
    "accountId": accountId,
    "password": password,
  };

  final response = await http.post(Uri.parse("$baseUrl/login"),
      headers: {
        "Content-Type": "application/json",
        "X-Not-Using-Xquare-Auth": "true",
      },
      body: jsonEncode(data));
  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
  debugPrint(response.body);
  return LoginResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
}
