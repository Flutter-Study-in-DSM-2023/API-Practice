import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'Info.dart';

void main() {
  final String URL = "https://jsonplaceholder.typicode.com/posts";

  Future<dynamic> fetch() async {
    final Dio dio = Dio();
    final Response response = await dio.get(URL);
    return response.data;
  }

  test("API GET 테스트", () async {
    print("받아오는 중");
    await fetch().then((value) {
      for (var v in value) {
        final info = Info.fromJson(v);
        info.printing();
      }
    }).catchError((error) => print("error"));

    print("받아옴");
  });
}
