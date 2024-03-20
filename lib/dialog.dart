import 'package:flutter/material.dart';
import 'package:quizzle/orange_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'min_icon_button.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final ImageProvider image;
  final double imageWidth;
  final double imageHeight;
  final String actionText;
  final VoidCallback onActionPressed;
  final bool showCustomRow;
  final String customText;
  final IconData closeIcon;
  final Function(BuildContext)
      onClosePressed; // Adjusted to accept a BuildContext

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.image,
    required this.imageWidth,
    required this.imageHeight,
    this.actionText = "Ok",
    required this.onActionPressed,
    this.showCustomRow = true,
    this.customText = "Profile",
    this.closeIcon = FontAwesomeIcons.xmark,
    required this.onClosePressed, // Now requires a BuildContext
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
              if (!showCustomRow) const SizedBox(height: 30),
              if (showCustomRow)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        customText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFF8F4F8),
                          fontSize: 25,
                          fontFamily: 'StudioFeixenSansTRIAL',
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(width: 20),
                      MinFaIconButton(
                        onTap: () => onClosePressed(
                            context), // Pass the context to onClosePressed
                        iconData: closeIcon,
                        iconColor: const Color(0xFFFFF9DB),
                        buttonColor: const Color(0xFFF88F1E),
                      ),
                    ],
                  ),
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
