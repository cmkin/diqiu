import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import './pages/index_page.dart';
import './pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "三体解密",
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(0, 179, 234, 1),
          primarySwatch: Colors.yellow,
        ),
        routes: {
          "/index": (context) => IndexPage(),
          "/": (context) => login(),
        },
      ),
    );
  }
}
