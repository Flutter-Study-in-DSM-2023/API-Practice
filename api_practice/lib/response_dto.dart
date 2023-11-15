class ResponseDTO {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ResponseDTO({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        id = json["id"],
        title = json["title"],
        completed = json["completed"];
}

class ResponseDTOList {
  final List<ResponseDTO>? list;

  ResponseDTOList({this.list});

  factory ResponseDTOList.fromJson(List<dynamic> json) {
    List<ResponseDTO> list = <ResponseDTO>[];
    list = json.map((i) => ResponseDTO.fromJson(i)).toList();

    return ResponseDTOList(
      list: list,
    );
  }
}