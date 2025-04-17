import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bobble_page.dart';

class chatmessseges extends StatefulWidget {
  const chatmessseges({super.key});

  @override
  State<chatmessseges> createState() => _chatmesssegesState();
}

class _chatmesssegesState extends State<chatmessseges> {
  final authenticatedUser=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .orderBy('createdAt', descending: false)
            .snapshots(),
        builder: (ctext, chatsnapshots) {
          if (chatsnapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!chatsnapshots.hasData || chatsnapshots.data!.docs.isEmpty) {
            return Center(
              child: Text('No Mesages Found'),
            );
          }
          if (chatsnapshots.hasError) {
            return Center(
              child: Text('No Mesages Founds'),
            );
          }
          final loadMeassages = chatsnapshots.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 40,
              left: 13,
              right: 13,
            ),
            reverse: false,
            itemCount: loadMeassages.length,
            itemBuilder: (ctx, index) {
              final chatMessage = loadMeassages[index].data();
              final nextChatMessage = index + 1 < loadMeassages.length
                  ? loadMeassages[index + 1].data()
                  : null;

              final currentMessageUserId = chatMessage['userId'];
              final nextMessageUserId =
              nextChatMessage != null ? nextChatMessage['userId'] : null;
              final nextUserIsSame = nextMessageUserId == currentMessageUserId;

              if (nextUserIsSame) {
                return MessageBubble.next(
                  message: chatMessage['text'],
                  isMe: authenticatedUser?.uid == currentMessageUserId,
                );
              } else {
                return MessageBubble.first(

                  username: chatMessage['username'],
                  message: chatMessage['text'],
                  isMe: authenticatedUser?.uid == currentMessageUserId,
                );
              }
            },
          );;
        });
  }
}
