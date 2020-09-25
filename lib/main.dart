import 'package:flutter/material.dart';
import 'package:new_flutter/Widgets/dial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset _positionBtn = Offset(16, 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: _positionBtn.dy,
            left: _positionBtn.dx,
            child: Draggable(
              onDragEnd: (details) {
                setState(() {
                  _positionBtn = details.offset;
                });
              },
              feedback: Dial(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 10.0,
                  ),
                ],
              ),
              childWhenDragging: Container(),
              child: Dial(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
