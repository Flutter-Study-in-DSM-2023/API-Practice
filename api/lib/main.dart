import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async => await fetch(),
        ),
      ),
    );
  }
}

Future<void> fetch() async {
  const String url = "https://onui.kanghyuk.co.kr/";

  final response = await http.get(
    Uri.parse("${url}user/profile"),
    headers: <String, String>{
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMTE4OTk5Njk2MzI0NDM4NTE5NTMiLCJpYXQiOjE3MDAwNTIxNzksImV4cCI6MTcwMjY0NDE3OX0.PAAHcyQ5zat6dbjcPkTj6Z6N_toE0oyXz2cL1opLef0',
    },
  );
  print(response.body);
}
