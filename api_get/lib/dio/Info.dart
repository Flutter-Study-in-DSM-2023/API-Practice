class Info {
  final int userId;
  final int id;
  final String title;
  final String body;

  Info({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      body: json["body"],
    );
  }

  void printing() {
    print("userId : $userId, id : $id, title : $title, body : $body\n");
  }
}

void main() {
  final Info tmp = Info.fromJson({
    "id": 1,
    "userId": 2,
    "title": "title",
    "body": "body"
  });

  tmp.printing();
}
