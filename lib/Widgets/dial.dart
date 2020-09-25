import 'package:flutter/material.dart';

class Dial extends StatefulWidget {
  List<BoxShadow> boxShadow;

  Dial({this.boxShadow});

  @override
  State<StatefulWidget> createState() => DialState();
}

class DialState extends State<Dial> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: widget.boxShadow,
      ),
      child: Stack(
        children: [
          GestureDetector(
            child: ClipPath(
              clipper: ArrowClipPath(),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.lime,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArrowClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  var weight = 16.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height-weight), radius: Radius.circular(size.width/2));
    path.lineTo(size.width - weight, size.height);
    path.arcToPoint(Offset(weight, size.height), radius: Radius.circular((size.width - weight * 2)/2));
    path.lineTo(0, size.height);
    // path.arcToPoint(Offset(size.width, size.height),
    //     radius: Radius.circular(50));
    // path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
