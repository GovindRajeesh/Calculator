import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var frameText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator by Govind Rajeesh"),
        ),
        body: Container(
            color: Colors.orange,
            child: ListView(children: <Widget>[
              Wrap(
                spacing: 39.0,
                runSpacing: 50.0,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border(
                              top: BorderSide(width: 5, color: Colors.grey),
                              right: BorderSide(width: 5, color: Colors.grey),
                              left: BorderSide(width: 5, color: Colors.grey),
                              bottom:
                                  BorderSide(width: 5, color: Colors.grey))),
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.topCenter,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          frameText,
                          style: TextStyle(fontSize: 80),
                        ),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "1";
                        });
                      },
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "2";
                        });
                      },
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "3";
                        });
                      },
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "+";
                        });
                      },
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "4";
                        });
                      },
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "5";
                        });
                      },
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "6";
                        });
                      },
                      child: Text(
                        "6",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "-";
                        });
                      },
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "7";
                        });
                      },
                      child: Text(
                        "7",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "8";
                        });
                      },
                      child: Text(
                        "8",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "9";
                        });
                      },
                      child: Text(
                        "9",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "×";
                        });
                      },
                      child: Text(
                        "X",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = "";
                        });
                      },
                      child: Text(
                        "C",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "0";
                        });
                      },
                      child: Text(
                        "0",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        var expression = frameText;
                        expression = expression.replaceAll('×', '*');
                        expression = expression.replaceAll('÷', '/');

                        try {
                          Parser p = Parser();
                          Expression exp = p.parse(expression);

                          ContextModel cm = ContextModel();
                          var result =
                              '${exp.evaluate(EvaluationType.REAL, cm)}';
                          setState(() {
                            frameText = result;
                          });
                        } catch (e) {
                          var result = frameText;
                          setState(() {
                            frameText = result;
                          });
                        }
                      },
                      child: Text(
                        "=",
                        style: TextStyle(fontSize: 60),
                      )),
                  FlatButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        setState(() {
                          frameText = frameText + "÷";
                        });
                      },
                      child: Text(
                        "÷",
                        style: TextStyle(fontSize: 60),
                      )),
                ],
              ),
            ])));
  }
}
