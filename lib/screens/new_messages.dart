import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final  _mssageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _mssageController.dispose();
    super.dispose();
  }

  void _SubmitMessage()async {
    final Entermessage = _mssageController.text;
    if (Entermessage
        .trim()
        .isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();


    final user =await FirebaseAuth.instance.currentUser!;
    final userData =await FirebaseFirestore.instance.collection('Users').doc(
        user.uid).get();
    FirebaseFirestore.instance.collection('chats').add({
    'text':_mssageController.text,
    'createdAt':Timestamp.now(),
    'userId':user.uid,
    'username':userData.data()!['UseName'],
    "userMail":userData.data()!['emailadress'],
    });
    _mssageController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, bottom: 14, right: 1),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autocorrect: true,
              enableSuggestions: true,
              controller: _mssageController,
              decoration: InputDecoration(labelText: 'Send a message'),
            ),
          ),
          IconButton(color: Theme
              .of(context)
              .colorScheme
              .primary, onPressed: _SubmitMessage, icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
