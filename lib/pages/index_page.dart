import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';

import 'message.dart';
import 'achievement.dart';
import 'mine.dart';
import 'knapsack.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    // ignore: deprecated_member_use
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    // ignore: deprecated_member_use
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    // ignore: deprecated_member_use
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    // ignore: deprecated_member_use
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页"))
  ];

  final List pages = [message(), mine(), achievement(), knapsack()];
  int currentIndex = 0;

  List titles = ["消息", "背包", "成就", "我的"];
  List normalImgUrls = [
    'images/tabbar/m_n.png',
    'images/tabbar/b_n.png',
    'images/tabbar/a_n.png',
    'images/tabbar/i_n.png',
  ];
  List selectedImgUrls = [
    'images/tabbar/m_n.png',
    'images/tabbar/b_n.png',
    'images/tabbar/a_n.png',
    'images/tabbar/i_n.png',
  ];

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Flex(direction: Axis.horizontal, children: <Widget>[
          Expanded(
            flex: 1,
            child: tabbar(0),
          ),
          Expanded(
            flex: 1,
            child: tabbar(1),
          ),
          Expanded(
            flex: 1,
            child: tabbar(2),
          ),
          Expanded(
            flex: 1,
            child: tabbar(3),
          ),
        ]),
      ),
      body: pages[currentIndex],
    );
  }

  // 自定义BottomAppBar
  Widget tabbar(int index) {
    //设置默认未选中的状态
    TextStyle style =
        TextStyle(fontSize: 15, color: Color.fromRGBO(20, 85, 113, 1));
    String imgUrl = normalImgUrls[index];
    if (currentIndex == index) {
      //选中的话
      style = TextStyle(fontSize: 16, color: Colors.blue);
      imgUrl = selectedImgUrls[index];
    }
    //构造返回的Widget
    Widget item = Container(
      color: Colors.black,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(child: Image.asset(imgUrl, width: 80, height: 80)),
            Positioned(
              left: 55.0,
              bottom: 5.0,
              child: Text(
                titles[index],
                style: style,
              ),
            ),
          ],
        ),
        // child: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: <Widget>[
        //     Image.asset(imgUrl, width: 80, height: 80),
        //     Text(
        //       titles[index],
        //       style: style,
        //     )
        //   ],
        // ),
        onTap: () {
          if (currentIndex != index) {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
    );
    return item;
  }
}
