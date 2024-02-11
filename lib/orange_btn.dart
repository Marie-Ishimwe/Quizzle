import 'package:flutter/material.dart';

class CustomOrangeButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomOrangeButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            width: size.width * 0.8,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F4F8),
              borderRadius: BorderRadius.circular(30),
              shape: BoxShape.rectangle,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFE9E6D1),
                  offset: Offset(0, 4),
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Color(0xFFEFEEE6),
                  offset: Offset(0, -3),
                  spreadRadius: -2,
                ),
              ],
            ),
          ),
          Positioned(
            top: 9,
            left: 5.5,
            right: 5.5,
            bottom: 3,
            child: Container(
              width: size.width * 0.7,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF88F1E),
                borderRadius: BorderRadius.circular(25),
                shape: BoxShape.rectangle,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 221, 129, 37),
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 238, 147, 56),
                    offset: Offset(0, -3),
                    // blurRadius: 1,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFF8F4F8),
                    fontSize: 18,
                    fontFamily: 'StudioFeixenSansTRIAL',
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
