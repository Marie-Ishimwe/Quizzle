import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/category_description.dart';
import 'package:quizzle/dashboard.dart';

import 'icon_smaller.dart';

class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 6),
              blurRadius: 4),
          BoxShadow(
            color: Color.fromRGBO(234, 128, 14, 1),
            offset: Offset(0, -3),
            spreadRadius: -1,
          ),
        ],
        color: Color.fromRGBO(248, 143, 30, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallerFaIconButton(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Playground()));
              },
              iconData: FontAwesomeIcons.xmark,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(248, 244, 248, 1),
                  fontFamily: 'StudioFeixenSansTRIAL',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.40,
                  height: 1.2),
            ),
            SmallerFaIconButton(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryDescription()));
              },
              iconData: FontAwesomeIcons.question,
            ),
          ],
        ),
      ),
    );
  }
}
