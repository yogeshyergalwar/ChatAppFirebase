import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
         actions: [
            IconButton(onPressed: () {
              FirebaseAuth.instance.signOut();
            }, icon: Icon(Icons.exit_to_app))
         ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('CHAT SCREEN'),
          ],
        ),
      ),

    );
  }
}
