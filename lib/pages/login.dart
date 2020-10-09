import 'package:flutter/material.dart';
import '../components/page.dart';

class login extends StatelessWidget {
  const login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageMain(
        child: Stack(alignment: Alignment.topLeft, children: [
          Image(
            image: AssetImage("images/login_bg.png"),
            width: 100.0,
            height: 100.0,
          )
        ]),
      ),
    );
  }
}
