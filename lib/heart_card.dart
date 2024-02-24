import 'package:flutter/material.dart';
import 'package:quizzle/purchase_btn.dart';

class HeartCard extends StatelessWidget {
  const HeartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 106,
      height: 250,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 106,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    '+2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'StudioFeixenSansTRIAL',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w900,
                        height: 1.2),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Container(
                    width: 53,
                    height: 45,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/heart.png'),
                          fit: BoxFit.fitWidth),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 85,
            left: 0,
            child: Container(
              width: 106,
              height: 48,
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
                child: PurchaseButton(buttonText: '1,000', onPressed: () {}),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
