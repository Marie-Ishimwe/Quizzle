import 'package:flutter/material.dart';

class Wins extends StatelessWidget {
  const Wins({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 18,
            child: Container(
              width: 80,
              height: 30,
              decoration: const ShapeDecoration(
                color: Color(0xFFFDFDFC),
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
                    color: Color(0xFFE8E3E0),
                    offset: Offset(0, 1),
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Color(0xFFBEBBBB),
                    offset: Offset(0, -1),
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    '500',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF88F1E),
                      fontSize: 14,
                      fontFamily: 'StudioFeixenSansTRIAL',
                      // fontWeight: FontWeight.w800,
                      height: 0.06,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 5.5,
            child: Container(
              width: 46.0,
              height: 40.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/star.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
