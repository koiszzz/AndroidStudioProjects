import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  title: 'Flutter Tutorial',
  home: new MainPage(),
));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() {
    // TODO: implement createState
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = new CurvedAnimation(
      parent: new ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = new Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          title: const Text('主页'),
          leading: new IconButton(
              icon: new Icon(Icons.menu, color: Colors.white),
              onPressed: _openDrawer)),
      //body占屏幕的大部分
      body: new Center(
        child: new Text('空白主页'),
      ),
      drawer: new Drawer(
        child: new Column(),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: '添加记录', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: _addNewTrade,
      ),
    );

  }

  void _addNewTrade() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text('记一笔'),),
        body: null,
      );
    }));
  }
}
