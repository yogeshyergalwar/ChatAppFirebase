import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class authScreen extends StatefulWidget {
  const authScreen({super.key});

  @override
  State<authScreen> createState() => _authScreenState();
}

final firebase = FirebaseAuth.instance;

class _authScreenState extends State<authScreen> {
  var _isLogin = true;
  final _Form = GlobalKey<FormState>();
  var Enteremsil = '';
  var Enterpassword = '';

  Future<void> _submit() async {
    final isValid = _Form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _Form.currentState!.save();
    print(Enterpassword);
    print(Enteremsil);
    try {
      if (_isLogin) {
        final Credential = await firebase.signInWithEmailAndPassword(
            email: Enteremsil, password: Enterpassword);
        print(Credential);
      } else {
        final Credential = await firebase.createUserWithEmailAndPassword(
            email: Enteremsil, password: Enterpassword);
        print(Credential);
        await FirebaseFirestore.instance.collection('Users').doc(
            Credential.user?.uid).set(
            {
              'UseName':'please fill the ',
              'emailadress':Enteremsil,
              "Password":Enterpassword
            });
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'Alreadt-Register') {

      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? 'Failed to SignUp')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _Form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Email Adress'),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          validator: (value) {
                            if (value == null ||
                                value
                                    .trim()
                                    .isEmpty ||
                                !value.contains('@'))
                              return 'Please Enter Valid Email Id';
                            return null;
                          },
                          onSaved: (value) {
                            Enteremsil = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Password'),
                          ),
                          textCapitalization: TextCapitalization.none,
                          autocorrect: false,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .length <= 6)
                              return 'Password Contains atleast more than 6 characters';
                            return null;
                          },
                          onSaved: (value) {
                            Enterpassword = value!;
                          },
                        ),
                        ElevatedButton(
                            onPressed: _submit,
                            child: Text(_isLogin ? 'Login' : 'Signup')),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = _isLogin ? false : true;
                              });
                            },
                            child: Text(_isLogin
                                ? 'Create an account'
                                : 'I aready have an account'))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
