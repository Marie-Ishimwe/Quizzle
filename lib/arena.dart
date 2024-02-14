import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/icon_smaller.dart';

class Arena extends StatefulWidget {
  const Arena({super.key});

  @override
  State<Arena> createState() => _ArenaState();
}

class _ArenaState extends State<Arena> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(80), // Set the total height of the AppBar
        child: Container(
          margin: const EdgeInsets.only(
            left: 2,
          ),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SmallerFaIconButton(
                    onTap: () {},
                    iconData: FontAwesomeIcons.user,
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 15,
                        child: Container(
                          width: 60,
                          height: 30,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFDFDFC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0xFFE8E3E0),
                                offset: Offset(0, 1),
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Color(0xFFBEBBBB),
                                offset: Offset(0, -1),
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                '25',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF88F1E),
                                  fontSize: 14,
                                  fontFamily: 'StudioFeixenSansTRIAL',
                                  // fontWeight: FontWeight.w800,
                                  height: 0.06,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2,
                        top: 9,
                        child: Container(
                          width: 40,
                          height: 35.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/heart.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 110,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 18,
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFDFDFC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0xFFE8E3E0),
                                offset: Offset(0, 1),
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Color(0xFFBEBBBB),
                                offset: Offset(0, -1),
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                '500',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF88F1E),
                                  fontSize: 14,
                                  fontFamily: 'StudioFeixenSansTRIAL',
                                  // fontWeight: FontWeight.w800,
                                  height: 0.06,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 5.5,
                        child: Container(
                          width: 46.0,
                          height: 40.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/star.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // *********coins
                SizedBox(
                  width: 110,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: 95,
                          height: 30,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFDFDFC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0xFFE8E3E0),
                                offset: Offset(0, 1),
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Color(0xFFBEBBBB),
                                offset: Offset(0, -1),
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: Text(
                                '50000',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFF88F1E),
                                  fontSize: 14,
                                  fontFamily: 'StudioFeixenSansTRIAL',
                                  // fontWeight: FontWeight.w800,
                                  height: 0.06,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 7.5,
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/coin.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/final_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0x33523445),
                      Colors.black.withOpacity(0.8999999761581421),
                    ],
                    begin: const Alignment(0.00, -1.00),
                    end: const Alignment(0, 1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                  child: Stack(
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(-2.36),
                        child: const Divider(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          thickness: 1,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 23,
                        child: Container(
                          width: 135,
                          height: 135,
                          decoration: const ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.26, -0.97),
                              end: Alignment(-0.26, 0.97),
                              colors: [Color(0xC9F45E29), Color(0xFFE85B20)],
                            ),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 131,
                        left: 5,
                        child: Container(
                          width: 145,
                          height: 40,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFD612A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color.fromARGB(255, 246, 102, 50),
                                offset: Offset(0, 2),
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Color.fromARGB(255, 246, 94, 6),
                                offset: Offset(0, -3),
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'general',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(248, 244, 248, 1),
                                fontSize: 18,
                                fontFamily: 'Stopbuck',
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 5,
                          left: 14,
                          child: Container(
                              width: 112,
                              height: 136,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/bear.png'),
                                    fit: BoxFit.fitWidth),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
