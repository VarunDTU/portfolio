import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/contact.dart';
import 'package:proj/homepage.dart';
import 'package:proj/project.dart';
import 'package:proj/projectlist.dart';

class Appbarnew extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);
  const Appbarnew({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 1000),
      child: Padding(
        padding: EdgeInsets.only(top: size.height / 20),
        child: Container(
          color: Color.fromARGB(0, 4, 0, 72),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width / 20),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Homepage())));
                    },
                    child: Text(
                      "HOME",
                      style: GoogleFonts.pressStart2p(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: size.width / 50),
                    )),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 20,
              // ),
              Padding(
                padding: EdgeInsets.only(left: size.width / 20),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ProjectList())));
                    },
                    child: Text(
                      "PROJECTS",
                      style: GoogleFonts.pressStart2p(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: size.width / 50),
                    )),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 20,
              // ),
              Padding(
                padding: EdgeInsets.only(left: size.width / 20),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Contactme())));
                    },
                    child: Text(
                      "CONTACT",
                      style: GoogleFonts.pressStart2p(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: size.width / 50),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
