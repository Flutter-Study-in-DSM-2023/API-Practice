import 'package:flutter/material.dart';

void main() {
  runApp(MessengerApp());
}

class MessengerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MessengerScreen(),
    );
  }
}

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: Icon(Icons.menu), // Replace with your desired menu icon
          onPressed: () {
            // Add the menu functionality here
          },
        ),
        title: Text(
          '채팅',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // 더보기 메뉴 추가
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '검색',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              ),
              onChanged: (text) {},
            ),
          ),
          Expanded(
            child: ChatList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_comment),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: '통화',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '사람',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: '스토리',
          ),
        ],
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.blueAccent,
        selectedLabelStyle: TextStyle(color: Colors.blueAccent),
        unselectedLabelStyle: TextStyle(color: Colors.blue),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ChatItem(
          senderName: '2023 DSM',
          message: 'dsds',
          time: '오후 8:02',
        );
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final String senderName;
  final String message;
  final String time;

  ChatItem({required this.senderName, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://example.com/profile-image.jpg'),
      ),
      title: Text(senderName),
      subtitle: Text(message),
      trailing: Text(time),
      onTap: () {
        // 채팅 화면으로 이동하는 코드 추가
      },
    );
  }
}
