import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/bottomnavi.dart';
import 'appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contactme extends StatefulWidget {
  Contactme({Key? key}) : super(key: key);

  @override
  State<Contactme> createState() => _ContactmeState();
}

class _ContactmeState extends State<Contactme> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbarnew(),
        body: AnimatedBackground(
          behaviour: SpaceBehaviour(backgroundColor: Colors.black),
          vsync: this,
          child: Row(
            children: [
              Container(
                child: Text("hello"),
              )
            ],
          ),
        ),
        bottomNavigationBar: Bottomnav());
  }
}
