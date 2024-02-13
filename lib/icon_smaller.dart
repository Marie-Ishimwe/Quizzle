import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmallerFaIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final Color iconColor;
  final Color buttonColor;

  const SmallerFaIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
    this.iconColor = const Color(0xFFFFF9DB),
    this.buttonColor = const Color(0xFFF88F1E),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const ShapeDecoration(
              color: Color(0xFFFDFDFC),
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                    color: Color(0xFFE9E6D1),
                    offset: Offset(0, 2),
                    spreadRadius: 2),
                BoxShadow(
                    color: Color(0xFFEFEEE6),
                    offset: Offset(0, -2),
                    spreadRadius: -2),
              ],
            ),
          ),
          Positioned(
            left: 2,
            top: 7,
            right: 2.5,
            bottom: 2,
            child: Container(
              width: 20,
              height: 20,
              decoration: ShapeDecoration(
                color: buttonColor,
                shape: const OvalBorder(),
                shadows: const [
                  BoxShadow(
                    color: Color(0xFFD98531),
                    blurRadius: 0,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0xFFFC9B3C),
                    blurRadius: 0,
                    offset: Offset(0, -3),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Center(
                child: FaIcon(
                  iconData,
                  size: 18.0,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
