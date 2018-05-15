import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    theme: new ThemeData(
        primarySwatch: Colors.green,
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>  with SingleTickerProviderStateMixin{
  TabController tabcontroller;

  @override
  void initState(){
    super.initState();
    tabcontroller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('appbar'),),
      body: new TabBarView(
        children: <Widget>[new Pages('First'), new Pages('Second'), new Pages('third')],
        controller: tabcontroller,
      ),
    );
  }
}


class Pages extends StatelessWidget {
  @override
  final String title;
  Pages(this.title);
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}