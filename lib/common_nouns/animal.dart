import 'package:flutter/material.dart';

class Animals extends StatelessWidget {
  const Animals({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 10,
          top: 23,
          child: Container(
            width: 135,
            height: 135,
            decoration: const ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.63, -0.78),
                end: Alignment(-0.63, 0.78),
                colors: [Color(0xD3AB5C23), Color(0xFF924C1E)],
              ),
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, -4),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 131,
          left: 5,
          child: Container(
            width: 150,
            height: 37,
            decoration: const ShapeDecoration(
              color: Color(0xFF924C1E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color.fromARGB(255, 145, 73, 25),
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 143, 77, 33),
                  offset: Offset(0, -3),
                  spreadRadius: -1,
                ),
              ],
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'animals',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(248, 244, 248, 1),
                  fontSize: 18,
                  fontFamily: 'Stopbuck',
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 25,
            child: Container(
                width: 103,
                height: 129,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/dog.png'),
                      fit: BoxFit.fitWidth),
                ))),
      ],
    );
  }
}
