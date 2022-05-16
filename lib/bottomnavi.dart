import 'dart:async';
import 'dart:html' as html;
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '.env.dart';

class Bottomnav extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);
  Bottomnav({Key? key}) : super(key: key);

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 1000),
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height / 10),
        child: Container(
            child: Row(
          children: [
            IconButton(
              onPressed: () {
                html.window.open(twitterp, 'new tab');
              },
              icon: Icon(FontAwesomeIcons.twitter),
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {
                  html.window.open(githubp, 'new tab');
                },
                icon: Icon(FontAwesomeIcons.githubSquare, color: Colors.white)),
            IconButton(
                onPressed: () {
                  html.window.open(linkedinp, 'new tab');
                },
                icon: Icon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.white,
                ))
          ],
        )),
      ),
    );
  }
}
