import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 15,
          top: 23,
          child: Container(
            width: 135,
            height: 135,
            decoration: const ShapeDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.2726230025291443, 1.020270824432373),
                  end: Alignment(-1.020270824432373, 0.2726230025291443),
                  colors: [
                    Color.fromRGBO(96, 61, 59, 0.8799999952316284),
                    Color.fromRGBO(96, 61, 59, 1)
                  ]),
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
              color: Color(0xFF603D3B),
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
                  color: Color.fromARGB(255, 92, 57, 55),
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 93, 56, 54),
                  offset: Offset(0, -3),
                  spreadRadius: -1,
                ),
              ],
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'time',
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
            top: 16,
            left: 28,
            child: Container(
                width: 112,
                height: 128,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/time.png'),
                      fit: BoxFit.fitWidth),
                ))),
      ],
    );
  }
}
