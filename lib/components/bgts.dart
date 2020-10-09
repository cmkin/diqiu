import 'package:flutter/material.dart';

class BgTs extends StatefulWidget {
  Widget child;
  BgTs({@required this.child});

  @override
  _BgTsState createState() => _BgTsState();
}

class _BgTsState extends State<BgTs> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //backgroundColor: Colors.black,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              right: 48.0,
              bottom: 120.0,
              child: Listener(
                  child: SlideTransition(
                    position: _controller.drive(
                        Tween(begin: Offset(0, 0), end: Offset(0, -0.3))),
                    child: Image(
                      image: AssetImage("images/bg_ts.png"),
                      width: 80.0,
                      height: 80.0,
                    ),
                  ),
                  onPointerDown: (e) => {print(e)})),
          Positioned(
            child: widget.child,
            top: 0,
            left: 0,
          ),
        ]),
      ),
    );
  }
}
