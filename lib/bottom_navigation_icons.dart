import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationIcon extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final Color buttonColor;

  const BottomNavigationIcon({
    super.key,
    required this.iconData,
    this.iconColor = const Color(0xFFFFF9DB),
    this.buttonColor = const Color(0xFFF88F1E),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 45,
        height: 45,
        decoration: const ShapeDecoration(
          color: Color(0xFFFDFDFC),
          shape: OvalBorder(),
          shadows: [
            BoxShadow(
                color: Color(0xFFE9E6D1),
                offset: Offset(0, 1),
                spreadRadius: 1),
            BoxShadow(
                color: Color(0xFFEFEEE6),
                offset: Offset(0, -2),
                spreadRadius: -1),
          ],
        ),
      ),
      Positioned(
        left: 4.5,
        top: 7,
        right: 4.5,
        bottom: 5,
        child: Container(
          width: 35,
          height: 35,
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
              size: 20.0,
              color: iconColor,
            ),
          ),
        ),
      ),
    ]);
  }
}
