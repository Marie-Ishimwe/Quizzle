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
              top: 5, left: 5), // Adjust the margin values as needed
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: SmallerFaIconButton(
                  onTap: () {},
                  iconData: FontAwesomeIcons.user,
                ),
              ),
              SizedBox(
                width: 150,
                height: 60,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 50,
                      child: Container(
                        width: 75,
                        height: 40,
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
                                fontSize: 18,
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
                      left: 30,
                      top: 9,
                      child: Container(
                        width: 51.27,
                        height: 45.74,
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
                width: 150,
                height: 60,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 50,
                      child: Container(
                        width: 95,
                        height: 40,
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
                                fontSize: 18,
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
                      left: 28,
                      top: 4.5,
                      child: Container(
                        width: 57.27,
                        height: 52.74,
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
                width: 150,
                height: 60,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 50,
                      child: Container(
                        width: 95,
                        height: 40,
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
                                fontSize: 18,
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
                      left: 28,
                      top: 4.5,
                      child: Container(
                        width: 57.27,
                        height: 52.74,
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
      body: Container(
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
              Colors.black.withOpacity(0.8999999761581421)
            ],
            begin: const Alignment(0.00, -1.00),
            end: const Alignment(0, 1),
          )),
          // child: Stack(
          //   children: [
          //     Positioned(
          //       top: 10,
          //       left: 50,
          //       child: Container(
          //         width: 75,
          //         height: 40,
          //         decoration: const ShapeDecoration(
          //           color: Color(0xFFFDFDFC),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.only(
          //               topRight: Radius.circular(20.0),
          //               bottomRight: Radius.circular(20.0),
          //               topLeft: Radius.circular(20.0),
          //               bottomLeft: Radius.circular(20.0),
          //             ),
          //           ),
          //           shadows: [
          //             BoxShadow(
          //                 color: Color(0xFFE8E3E0),
          //                 offset: Offset(0, 1),
          //                 spreadRadius: 1),
          //             BoxShadow(
          //                 color: Color(0xFFBEBBBB),
          //                 offset: Offset(0, -1),
          //                 spreadRadius: -1),
          //           ],
          //         ),
          //         child: const Align(
          //           alignment: Alignment.center,
          //           child: Padding(
          //             padding: EdgeInsets.only(left: 20.0),
          //             child: Text(
          //               '25',
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                 color: Color(0xFFF88F1E),
          //                 fontSize: 18,
          //                 fontFamily: 'StudioFeixenSansTRIAL',
          //                 // fontWeight: FontWeight.w800,
          //                 height: 0.06,
          //                 letterSpacing: 1,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       left: 30,
          //       top: 9,
          //       child: Container(
          //         width: 51.27,
          //         height: 45.74,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage('images/heart.png'),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
