import 'package:flutter/material.dart';

class Lives extends StatelessWidget {
  final String livesValues;
  const Lives({
    super.key,
    required this.livesValues,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 15,
            child: Container(
              width: 60,
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
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    livesValues,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
            left: 2,
            top: 9,
            child: Container(
              width: 40,
              height: 35.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/heart.png'),
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
