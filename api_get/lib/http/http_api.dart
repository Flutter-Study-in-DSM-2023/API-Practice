import 'dart:convert';// JSON을 인코딩하거나 디코딩하는 데 사용되는 라이브러리
import 'package:test/test.dart';
import 'package:http/http.dart' as http;//HTTP 요청을 하기 위한 http 패키지
import 'Info.dart';

void main() {
  final String URL = "https://jsonplaceholder.typicode.com/";
  final request = Uri.parse(URL+"posts");


  Future<dynamic> fetch() async {
    final response = await http.get(request);
    print(jsonDecode(response.body));
  }

  test("API GET 테스트", () async {
    print("받아오는 중");
    await fetch().then((value) {
      for(var v in value){
        v.printing();
      }
    }).catchError((error) => print("error"));

    print("받아옴");
  });
}
