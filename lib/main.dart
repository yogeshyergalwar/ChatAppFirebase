import 'package:chat_app/screens/auth.dart';
import 'package:chat_app/screens/chatscreen.dart';
import 'package:chat_app/screens/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());

}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterChat',
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 63, 17, 177)),
        ),
        home:StreamBuilder(stream:FirebaseAuth.instance.authStateChanges() ,builder: (ctxt,Snapshot){
          if(Snapshot.connectionState==ConnectionState.waiting){
            return splashScreen();
          }
          if(Snapshot.hasData){
            return Chatscreen();
          }
          return  authScreen();
        },),
    );
  }
}