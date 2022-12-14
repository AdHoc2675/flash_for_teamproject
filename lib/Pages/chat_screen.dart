import 'package:flash_for_teamproject/chatting/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../chatting/chat/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat screen'),
        actions: [
          IconButton(
              onPressed: () {
                _authentication.signOut();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Logout 하였습니다.')));
                Navigator.pushNamed(context, '/login');
              },
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Messages(),
          ),
          NewMessages(),
        ],
      )),
    );
  }
}
