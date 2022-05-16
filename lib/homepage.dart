import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/bottomnavi.dart';
import '.env.dart';
import 'appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  String intro_name = "Developer";
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //print(size.width);
    bool isScreenWide = MediaQuery.of(context).size.width >= 658;
    final perodictimer = Timer.periodic(
        const Duration(
          seconds: 3,
        ), (timer) {
      if (intro_name.length < 13) {
        if (this.mounted) {
          setState(() {
            intro_name += '.';
          });
        }
      } else {
        if (this.mounted) {
          setState(() {
            intro_name = "Developer";
          });
        }
      }
    });

    return Scaffold(
      appBar: Appbarnew(),
      backgroundColor: Colors.grey,
      body: AnimatedBackground(
        behaviour:
            SpaceBehaviour(backgroundColor: Color.fromARGB(255, 0, 5, 46)),
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
                      "Hi I'm Varun\n",
                      style: GoogleFonts.pressStart2p(
                          color: Colors.white,
                          fontSize: size.height / 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$intro_name",
                      style: GoogleFonts.pressStart2p(
                          color: Colors.white,
                          fontSize: size.height / 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: size.width / 2),
                      child: Text(
                        aboutme,
                        style: GoogleFonts.pressStart2p(
                            color: Colors.white,
                            fontSize: size.height / 60,
                            height: 2),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 50),
                    child: Image.asset(
                      '/images/face.png',
                      width: size.width / 4,
                      height: size.width / 4,
                    ),
                  ),
                ],
              ),
            ),
            // Row(children: [
            //   Padding(
            //     padding: EdgeInsets.only(
            //       top: 0,
            //     ),
            //     child: Text(
            //       "Student Developer",
            //       style: GoogleFonts.pressStart2p(
            //           color: Colors.white, fontSize: size.width / 40),
            //     ),
            //   ),
            //   Padding(
            //     padding: EdgeInsets.only(
            //       top: 0,
            //     ),
            //     child: Text(
            //       "Student Developer",
            //       style: GoogleFonts.pressStart2p(
            //           color: Colors.white, fontSize: size.width / 40),
            //     ),
            //   )
            // ])
          ],
        ),
      ),
      bottomNavigationBar: Bottomnav(),
    );
  }
}
