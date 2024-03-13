import 'package:flutter/material.dart';
import 'package:quizzle/green_btn.dart';
import 'package:quizzle/orange_btn.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final ImageProvider image;
  final double imageWidth;
  final double imageHeight;
  final String actionText;
  final VoidCallback onActionPressed;
  final bool
      showSecondButton; // New parameter to control the visibility of the second button
  final String secondButtonText; // New parameter for the second button text
  final VoidCallback
      onSecondButtonPressed; // New parameter for the action to be performed when the second button is pressed

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.image,
    required this.imageWidth,
    required this.imageHeight,
    this.actionText = "Ok",
    required this.onActionPressed,
    this.showSecondButton =
        false, // Initialize the new parameter with a default value of false
    this.secondButtonText =
        "Second Action", // Initialize the new parameter with a default value
    required this.onSecondButtonPressed, // Initialize the new parameter
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF88F1E),
          borderRadius: BorderRadius.circular(30),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 221, 129, 37),
              offset: Offset(0, 3),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 238, 147, 56),
              offset: Offset(0, -3),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFAEACA),
                    border: Border.all(
                      width: 10,
                      color: const Color(0xFFDE8627),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: image,
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF0A040A),
                        fontSize: 32,
                        fontFamily: 'StudioFeixenSansTRIAL',
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
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
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomOrangeButton(
                buttonText: actionText,
                onPressed: onActionPressed,
                buttonWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              const SizedBox(height: 20),
              if (showSecondButton) // Conditional rendering based on showSecondButton
                CustomGreenButton(
                  buttonText: secondButtonText,
                  onTap: onSecondButtonPressed,
                  // buttonWidth: MediaQuery.of(context).size.width * 0.7,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
