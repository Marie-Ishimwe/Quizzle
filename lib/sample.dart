import 'package:flutter/material.dart';
import 'dart:math' as math;

class Property1generalWidget extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
          // Figma Flutter Generator Property1generalWidget - COMPONENT
            return Container(
      width: 143,
      height: 165,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 144,
        left: 122,
        child: Transform.rotate(
        angle: 135 * (math.pi / 180),
        child: const Divider(
        color: Color.fromRGBO(0, 0, 0, 1),
        thickness: 1
      )
,
      )
      ),Positioned(
        top: 23,
        left: 4,
        child: Container(
        width: 135,
        height: 135,
        decoration: BoxDecoration(
          boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0,4),
          blurRadius: 4
      )],
      gradient : LinearGradient(
          begin: Alignment(0.2726230025291443,1.020270824432373),
          end: Alignment(-1.020270824432373,0.2726230025291443),
          colors: [Color.fromRGBO(244, 94, 41, 0.7900000214576721),Color.fromRGBO(232, 91, 32, 1)]
        ),
      borderRadius : BorderRadius.all(Radius.elliptical(135, 135)),
  )
      )
      ),Positioned(
        top: 131,
        left: 0,
        child: SvgPicture.asset(
        'assets/images/rectangle13.svg',
        semanticsLabel: 'rectangle13'
      );
      ),Positioned(
        top: 137,
        left: 14,
        child: Text('general', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(248, 244, 248, 1),
        fontFamily: 'Stopbuck',
        fontSize: 16,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1.5
      ),)
      ),
      Positioned(
        top: 5,
        left: 14,
        child: Container(
        width: 112,
        height: 136,
        decoration: const BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/images/Bear.png'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    );
          }
        }
        