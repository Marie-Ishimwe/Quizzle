import 'package:flutter/material.dart';

class StatisticsContainer extends StatelessWidget {
  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  final String message;
  final String number;

  const StatisticsContainer({
    super.key,
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight,
    required this.message,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFAEACA),
          border: Border.all(
            width: 6,
            color: const Color(0xFFDE8627),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF0A040A),
                fontSize: 18,
                fontFamily: 'StudioFeixenSansTRIAL',
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0A040A),
                  decoration: TextDecoration.none,
                  letterSpacing: 0,
                  fontFamily: 'StudioFeixenSansTRIAL',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
