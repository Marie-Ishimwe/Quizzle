import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizzle/category_description.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/icon_smaller.dart';
import 'package:quizzle/orange_btn.dart';

class Difficultiness extends StatelessWidget {
  const Difficultiness({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/final_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0x33523445),
                Colors.black.withOpacity(0.6999999761581421)
              ],
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 85,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 6),
                        blurRadius: 4),
                    BoxShadow(
                      color: Color.fromARGB(255, 246, 94, 6),
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
                                  builder: (context) =>
                                      const CategoryDescription()));
                        },
                        iconData: FontAwesomeIcons.arrowLeft,
                      ),
                      const Text(
                        'Difficulty',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                                  builder: (context) => const Playground()));
                        },
                        iconData: FontAwesomeIcons.house,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.amber),
                        width: 275,
                        height: 120,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            children: [
                              CustomOrangeButton(
                                buttonText: "Easy",
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Playground()));
                                },
                              ),
                              Positioned(
                                  top: 0,
                                  left: 189,
                                  child: Container(
                                      width: 75,
                                      height: 83,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'images/dog_easy.png'),
                                            fit: BoxFit.fitWidth),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
