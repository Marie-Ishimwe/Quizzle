import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/min_icon_button.dart';
import 'package:quizzle/orange_btn.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final ImageProvider image;
  final double imageWidth; // New parameter for image width
  final double imageHeight; // New parameter for image height
  final bool
      showCloseButton; // New parameter to control the visibility of the close button
  final String actionText; // New parameter for the "Learn more" button text
  final VoidCallback
      onActionPressed; // New parameter for the action to be performed when the button is pressed

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.image,
    required this.imageWidth, // Initialize the new parameter
    required this.imageHeight, // Initialize the new parameter
    this.showCloseButton =
        true, // Initialize the new parameter with a default value of true
    this.actionText = "Ok", // Initialize the new parameter with a default value
    required this.onActionPressed, // Initialize the new parameter
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20), // Remove default padding
      backgroundColor:
          Colors.transparent, // Make the dialog background transparent
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
            mainAxisSize:
                MainAxisSize.min, // To make the dialog wrap its content
            children: <Widget>[
              if (showCloseButton) // Conditional rendering based on showCloseButton
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MinFaIconButton(
                      onTap: () {
                        // Navigation logic
                      },
                      iconData: FontAwesomeIcons.xmark,
                      iconColor: const Color(0xFFFFF9DB),
                      buttonColor: const Color(0xFFF88F1E),
                    )
                  ],
                ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFAEACA),
                    border: Border.all(
                      width: 10,
                      color: const Color(0xFFDE8627),
                    ),
                    // Make rounded corners
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: image,
                        width: imageWidth, // Use the imageWidth parameter
                        height: imageHeight, // Use the imageHeight parameter
                        fit: BoxFit.cover, // Adjust the fit as needed
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
                buttonText: actionText, // Use the actionText parameter
                onPressed: onActionPressed, // Use the onActionPressed parameter
                buttonWidth: MediaQuery.of(context).size.width * 0.7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
