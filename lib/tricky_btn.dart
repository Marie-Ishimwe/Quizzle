import 'package:flutter/material.dart';

class CustomTrickyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const CustomTrickyButton({
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
        height: 120,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              top: 34,
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
              top: 45,
              left: 5.5,
              right: 5.5,
              bottom: 25,
              child: Container(
                width: size.width * 0.7,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF56300),
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 202, 84, 6),
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      // color: Color.fromARGB(255, 237, 100, 9),
                      color: Color.fromARGB(255, 226, 97, 11),
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
                top: 10,
                left: 200,
                child: Container(
                    width: 78,
                    height: 96,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/duck.png'),
                          fit: BoxFit.fitWidth),
                    ))),
          ],
        ),
      ),
    );
  }
}
