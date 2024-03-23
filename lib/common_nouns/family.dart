import 'package:flutter/material.dart';

class Family extends StatelessWidget {
  const Family({super.key});

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
                  Color.fromRGBO(192, 53, 16, 0.7900000214576721),
                  Color.fromRGBO(197, 57, 19, 1)
                ],
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
              color: Color(0xFFC53A14),
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
                  color: Color.fromRGBO(196, 61, 23, 1),
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color.fromRGBO(198, 54, 15, 1),
                  offset: Offset(0, -3),
                  spreadRadius: -1,
                ),
              ],
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'family',
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
            top: 40,
            left: 25,
            child: Container(
                width: 123,
                height: 88,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/family.png'),
                      fit: BoxFit.fitWidth),
                ))),
      ],
    );
  }
}
