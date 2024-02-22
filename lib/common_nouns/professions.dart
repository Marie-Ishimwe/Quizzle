import 'package:flutter/material.dart';

class Professions extends StatelessWidget {
  const Professions({super.key});

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
                begin: Alignment(0.26, -0.97),
                end: Alignment(-0.26, 0.97),
                colors: [Color(0xDDBF5729), Color(0xFFBF592B)],
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
            height: 40,
            decoration: const ShapeDecoration(
              color: Color(0xFFB54E24),
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
                  color: Color.fromARGB(255, 184, 76, 33),
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 182, 78, 37),
                  offset: Offset(0, -3),
                  spreadRadius: -1,
                ),
              ],
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'professions',
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
            top: -5,
            left: 48,
            child: Transform(
              transform: Matrix4.identity()
                ..translate(0.0, 0.0)
                ..rotateZ(0.01),
              child: Container(
                  width: 83,
                  height: 145,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/doctor.png'),
                        fit: BoxFit.fitWidth),
                  )),
            )),
      ],
    );
  }
}
