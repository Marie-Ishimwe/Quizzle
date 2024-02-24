import 'package:flutter/material.dart';
import 'package:quizzle/small_btn.dart';

class Day7 extends StatelessWidget {
  const Day7({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 180,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 140,
              height: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Color(0xFFFAEACA),
              ),
              child: Center(
                child: Container(
                  width: 87,
                  height: 85,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/box.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 105,
            left: 0,
            child: Container(
              width: 140,
              height: 58,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 143, 31),
                    offset: Offset(0, 6),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 232, 142, 52),
                    offset: Offset(0, -6),
                    spreadRadius: 0,
                  ),
                ],
                color: Color(0xFFF2922A),
              ),
              child: Center(
                child: CustomSmallButton(buttonText: "Day 7", onPressed: () {}),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
