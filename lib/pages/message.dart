import 'package:flutter/material.dart';

import '../components/bgts.dart';

class message extends StatelessWidget {
  const message({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  child: BgTs(
                      child: Text(
                    "31312",
                    style: TextStyle(color: Colors.red),
                  )),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Text(
                    "I am Jack",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )));
  }
}
