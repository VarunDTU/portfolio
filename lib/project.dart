import 'dart:html' as html;
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/bottomnavi.dart';
import '.env.dart';
import 'appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Projectpage extends StatefulWidget {
  const Projectpage({Key? key}) : super(key: key);

  @override
  State<Projectpage> createState() => _ProjectpageState();
}

class _ProjectpageState extends State<Projectpage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //print(size.width);
    bool isScreenWide = MediaQuery.of(context).size.width >= 658;

    return Scaffold(
      appBar: const Appbarnew(),
      body: AnimatedBackground(
        behaviour: SpaceBehaviour(
            backgroundColor: const Color.fromARGB(255, 31, 0, 46)),
        vsync: this,
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: size.height / 10, left: size.width / 50),
              child: Flex(
                direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Text(
                      "Pothole mapping",
                      style: GoogleFonts.pressStart2p(
                          color: Colors.white,
                          fontSize: size.height / 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: size.width / 2),
                          child: Text(
                            "\nUploading and updating the database of pothole on road on Maps to help people driving their vehicle when the roads are flooded.",
                            style: GoogleFonts.pressStart2p(
                                color: Colors.white,
                                fontSize: size.height / 60,
                                height: 2),
                          ),
                        ),
                        TextButton(
                            onPressed: (() {
                              html.window.open(potproject, 'new tab');
                            }),
                            child: const Icon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 40),
                    child: Image.asset(
                      'images/caricon.png',
                      width: size.width / 10,
                      height: size.width / 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Bottomnav(),
    );
  }
}
