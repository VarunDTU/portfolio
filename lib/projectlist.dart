import 'dart:html' as html;
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/bottomnavi.dart';
import '.env.dart';
import 'appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isScreenWide = MediaQuery.of(context).size.width >= 658;

    return Scaffold(
      appBar: const Appbarnew(),
      backgroundColor: Colors.black,
      body: AnimatedBackground(
        behaviour: SpaceBehaviour(),
        vsync: this,
        child: ListView(
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
                    Container(
                      constraints: BoxConstraints(maxWidth: size.width / 3),
                      child: Text(
                        "\nUploading and updating the database of pothole on road on Maps to help people driving their vehicle when the roads are flooded.",
                        style: GoogleFonts.pressStart2p(
                            color: Colors.white,
                            fontSize: size.height / 60,
                            height: 2),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          html.window.open(potproject, 'new tab');
                        },
                        icon: Icon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        ))
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 50),
                    child: Image.asset(
                      'images/caricon.png',
                      width: size.width / 4,
                      height: size.width / 4,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height / 20),
              child: Image.asset(
                'images/amongus.png',
                width: size.width / 6,
                height: size.width / 6,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnav(),
    );
  }
}
