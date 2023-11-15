import 'dart:convert';

import 'package:api_practice/response_dto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

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
  Future<ResponseDTOList>? test;

  @override
  void initState() {
    test = get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: test,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemExtent: 30,
              itemCount: snapshot.data!.list!.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!.list![index].title);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<ResponseDTOList> get() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  if (response.statusCode != 200) {
    throw Exception('안불러와짐');
  }
  return ResponseDTOList.fromJson(jsonDecode(response.body));
}
//
// class ResponseCell extends StatefulWidget {
//   final ResponseDTO responseDTO;
//
//   const ResponseCell({
//     super.key
//     required this.responseDTO
//   });
//
//   @override
//   State<ResponseCell> createState() => _ResponseCellState();
// }
//
// class _ResponseCellState extends State<ResponseCell> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Column(
//         children: [
//           Text(responseDTO.id.toString()),
//           Text(responseDTO.title),
//         ],
//       ),
//     );
//   }
// }
