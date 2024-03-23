import 'package:flutter/material.dart';

class CustomGoogleButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const CustomGoogleButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size.width * 0.8,
        height: 80,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: size.width * 0.8,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Default background color
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
                      offset: Offset(0, -2),
                      spreadRadius: -2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 5.5,
              right: 5.5,
              bottom: 18,
              child: Container(
                width: size.width * 0.7,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7BC00),
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 206, 158, 2),
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 231, 181, 17),
                      offset: Offset(0, -3),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white, // Default text color
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
            Positioned(
                top: 22,
                left: 30,
                child: Container(
                    width: 25,
                    height: 26,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/google.png'),
                          fit: BoxFit.fitWidth),
                    ))),
          ],
        ),
      ),
    );
  }
}
