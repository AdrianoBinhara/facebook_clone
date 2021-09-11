import 'dart:ui';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  final FocusNode nodePassword = FocusNode();
  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        gestures: [GestureType.onTap, GestureType.onVerticalDragDown],
        child: GestureDetector(
            //onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Color(0XFF3b5998),
                body: SafeArea(
                    child: Container(
                        child: (Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 180, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/facebook_logo.png',
                                  height: 100,
                                ),
                                buildEmail(),
                                buildPassword(),
                                SizedBox(
                                  height: 7,
                                ),
                                buildLogin(),
                                Expanded(
                                    child: Align(
                                        alignment:
                                            FractionalOffset.bottomCenter,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Sign up for Facebook',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Need help?',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ],
                            ))))))),
      );

  Widget buildLogin() => ElevatedButton(
        child: Text('Log In'),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Color(0x3F898F9C),
            onPrimary: Colors.white,
            minimumSize: Size(500, 55),
            textStyle: TextStyle(fontSize: 20)),
        onPressed: () {},
      );

  Widget buildPassword() => TextField(
      focusNode: nodePassword,
      onChanged: (value) => setState(() => this.password = value),
      onSubmitted: (value) => setState(() => this.password = value),
      obscureText: isPasswordVisible,
      cursorColor: Colors.red,
      decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
          ),
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible),
          ),
          fillColor: Colors.white,
          hintText: 'Password',
          border: OutlineInputBorder(
              borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(5.0),
                  bottomRight: const Radius.circular(5.0)))));

  Widget buildEmail() => TextField(
      onSubmitted: (value) =>
          setState(() => FocusScope.of(context).requestFocus(nodePassword)),
      controller: emailController,
      cursorColor: Colors.red,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
        ),
        suffixIcon: emailController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                onPressed: () => emailController.clear(),
                icon: Icon(Icons.close),
              ),
        fillColor: Colors.white,
        hintText: 'email@example.com.br',
        border: OutlineInputBorder(
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(5.0),
                topRight: const Radius.circular(5.0))),
      ));
}
