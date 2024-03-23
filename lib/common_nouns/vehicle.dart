import 'package:flutter/material.dart';

class Vehicles extends StatelessWidget {
  const Vehicles({super.key});

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
                begin: Alignment(0.15, -0.99),
                end: Alignment(-0.15, 0.99),
                colors: [Color(0xF43D4458), Color(0xD107080E)],
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
          left: 4,
          child: Container(
            width: 150,
            height: 37,
            decoration: const ShapeDecoration(
              color: Color(0xFF282D3B),
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
                  color: Color.fromARGB(255, 41, 46, 58),
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 38, 43, 57),
                  offset: Offset(0, -3),
                  spreadRadius: -1,
                ),
              ],
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'vehicles',
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
            top: 43,
            left: 20,
            child: Container(
                width: 150,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/car.png'),
                      fit: BoxFit.fitWidth),
                ))),
      ],
    );
  }
}
