import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    theme: new ThemeData(
      primarySwatch: Colors.green,
    ),
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin{
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
        children: <Widget>[new Pages('one'), new Pages('two'), new Pages('three')],
        controller: tabcontroller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.teal,
        child: new TabBar(
          controller: tabcontroller,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.ac_unit),),
              new Tab(icon: new Icon(Icons.access_alarms),),
              new Tab(icon: new Icon(Icons.accessibility),)
            ])
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