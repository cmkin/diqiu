import 'package:flutter/material.dart';

import 'bgts.dart';

class PageMain extends StatefulWidget {
  Widget child;
  PageMain({@required this.child});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<PageMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: BgTs(
          child: widget.child,
        )),
      ),
    );
  }
}
