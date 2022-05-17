import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '.env.dart';

class Bottomnav extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);
  const Bottomnav({Key? key}) : super(key: key);

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
        padding: EdgeInsets.only(bottom: size.height / 100),
        child: Container(
            child: Row(
          children: [
            IconButton(
              onPressed: () {
                html.window.open(twitterp, 'new tab');
              },
              icon: const Icon(FontAwesomeIcons.twitter),
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {
                  html.window.open(githubp, 'new tab');
                },
                icon: const Icon(FontAwesomeIcons.githubSquare,
                    color: Colors.white)),
            IconButton(
                onPressed: () {
                  html.window.open(linkedinp, 'new tab');
                },
                icon: const Icon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.white,
                ))
          ],
        )),
      ),
    );
  }
}
