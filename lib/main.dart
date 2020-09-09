import 'package:flutter/material.dart';

// エントリー関数
// アロー関数ではなくてもよいが、Dartは処理が1行の場合は下記のように書くのが一般的
// runApp()はアプリ起動関数。引数にメインWidgetを渡す
void main() => runApp(MyApp());

// StatelessWidget:状態を持たないWidget, StatefulWidget:状態を持つWidget
class MyApp extends StatelessWidget {
  // build()は状態などが変わるたびに呼ばれる。Android javaで言うところのonCreateやonResumeなどに近い
  @override
  Widget build(BuildContext context) => MaterialApp(
        // アプリ名？
        title: 'Pavlova Demo',
        // アプリ内でのベースとなるデザインスタイルを指定
        theme: ThemeData(primarySwatch: Colors.blue),
        // home: 最初に起動させるページ(Widget)
        home: Pavlova(),
      );
}

class Pavlova extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Row:行を表現する
    final stars = Row(
      // mainAxisは水平方向, crossAxisは垂直方向
      // Column(列)では上記が逆になる。
      mainAxisSize: MainAxisSize.min,
      // childは単一のWidget, childrenはリストのWidgetをとる
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
      ],
    );

    final ratings = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        // Alignmentは左寄せ・中央寄せ・右寄せなどの配置を指定
        // spaceEvenlyは余白を入れて均等配置
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Expanded WidgetはWidgetを行内や列内に収めることが可能。
          // flex propertyを使用することで基準に対して倍率を指定することが可能。
          Expanded(
            child: stars,
          ),
          Expanded(
            child: Text(
              '170 Reviews',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );

    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    final leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          Text('titleText'),
          Text('subTitle'),
          ratings,
          iconList,
        ],
      ),
    );

    final sample = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: 440,
            child: leftColumn,
          ),
        ),
        Expanded(
          child: Image(image: AssetImage('assets/main.jpg')),
        ),
      ],
    );

    return Scaffold(
      body: Center(child: sample),
    );
  }
}
