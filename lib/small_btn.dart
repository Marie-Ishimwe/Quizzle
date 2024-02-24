import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomSmallButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            width: 100,
            height: 35,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F4F8),
              borderRadius: BorderRadius.circular(35),
              shape: BoxShape.rectangle,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFE9E6D1),
                  offset: Offset(0, 3),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color(0xFFEFEEE6),
                  offset: Offset(0, -3),
                  spreadRadius: -1,
                ),
              ],
            ),
          ),
          Positioned(
            top: 6,
            left: 4.5,
            right: 4.5,
            bottom: 2,
            child: Container(
              width: 90,
              height: 25,
              decoration: BoxDecoration(
                color: const Color(0xFFF88F1E),
                borderRadius: BorderRadius.circular(30),
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
                    fontSize: 16,
                    fontFamily: 'StudioFeixenSansTRIAL',
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w700,
                    // letterSpacing: 1.5,
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
