import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int factor1 = 2;
  int factor2 = 5;

  String getTextQuestion(){
    return factor1.toString() + ' X ' + factor2.toString();
  }

  checkOption(int value){
    bool isCorrect = value == factor1*factor2;

    (isCorrect)
      ? print("Acertou!")
      : print("Errou");
  }

  RaisedButton option(int value){
    return new RaisedButton(
      child: new Text(value.toString()),
      onPressed: () => checkOption(value),
    );
  }

  Column options(){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons()
    );
  }

  List buttons(){
    int initialFactor = factor2-2;
    int currentValue = 0;
    List buttons = <Widget>[];

    for (int i=0; i<5; i++){
      currentValue = factor1 * (initialFactor+i);
      buttons.add(option(currentValue)); 
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(getTextQuestion()),
            options(),
          ],
        ),
      )
    );
  }
}
