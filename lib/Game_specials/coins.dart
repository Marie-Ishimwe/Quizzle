import 'package:flutter/material.dart';

class Coins extends StatelessWidget {
  final String coinValue; // Parameter for the coin value

  const Coins({
    super.key,
    required this.coinValue, // Initialize the new parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 95,
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
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Text(
                    coinValue, // Use the coinValue parameter
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFF88F1E),
                      fontSize: 14,
                      fontFamily: 'StudioFeixenSansTRIAL',
                      // fontWeight: FontWeight.w800,
                      height: 0.06,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 7.5,
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/coin.png'),
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
