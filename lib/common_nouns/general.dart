import 'package:flutter/material.dart';
import 'package:quizzle/category_description.dart';

class General extends StatelessWidget {
  const General({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const CategoryDescription()));
      },
      child: Stack(
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
                  colors: [Color(0xC9F45E29), Color(0xFFE85B20)],
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
                color: Color(0xFFFD612A),
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
                    color: Color.fromARGB(255, 246, 102, 50),
                    offset: Offset(0, 2),
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 246, 94, 6),
                    offset: Offset(0, -3),
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'general',
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
              top: 5,
              left: 14,
              child: Container(
                  width: 115,
                  height: 136,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bear.png'),
                        fit: BoxFit.fitWidth),
                  ))),
        ],
      ),
    );
  }
}
