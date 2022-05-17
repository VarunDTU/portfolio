import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj/bottomnavi.dart';
import '.env.dart';
import 'appbar.dart';
import 'package:http/http.dart' as http;

var conformation = false;

class Contactme extends StatefulWidget {
  const Contactme({Key? key}) : super(key: key);

  @override
  State<Contactme> createState() => _ContactmeState();
}

class _ContactmeState extends State<Contactme> with TickerProviderStateMixin {
  final controllername = TextEditingController();
  final controllersubject = TextEditingController();
  final controllermessage = TextEditingController();
  final controlleremail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //print(size.width);
    bool isScreenWide = MediaQuery.of(context).size.width >= 658;
    return Scaffold(
        appBar: const Appbarnew(),
        body: AnimatedBackground(
          behaviour: SpaceBehaviour(backgroundColor: Colors.black),
          vsync: this,
          child: ListView(
            children: [
              Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                children: [
                  Visibility(
                    visible: conformation,
                    child: Text(
                      'Mail send sucessfully :)',
                      style: GoogleFonts.firaCode(
                          backgroundColor: Colors.green, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 20),
                    child: Container(
                      //color: Color.fromARGB(94, 61, 0, 83),
                      width: size.width / 2.5,
                      child: Column(
                        children: [
                          buildtextfield(
                              title: 'Name',
                              controller: controllername,
                              lines: 1,
                              size: size),
                          buildtextfield(
                              title: 'Email',
                              controller: controlleremail,
                              lines: 1,
                              size: size),
                          buildtextfield(
                              title: 'Subject',
                              controller: controllersubject,
                              lines: 2,
                              size: size),
                          buildtextfield(
                              title: 'Message',
                              controller: controllermessage,
                              lines: 4,
                              size: size),
                          ElevatedButton(
                              onPressed: () {
                                sendEmail(
                                    name: controllername.text,
                                    email: controlleremail.text,
                                    subject: controllersubject.text,
                                    message: controllermessage.text);
                              },
                              child: Text('send Mail uWu'))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.height / 50, top: size.height / 50),
                    child: Container(
                      child: Image.asset(
                        'images/dRnZXr.gif',
                        width: size.width / 4,
                        height: size.width / 4,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: const Bottomnav());
  }

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': service_id,
          'template_id': template_id,
          'user_id': user_id,
          'template_params': {
            'user_subject': subject,
            'user_email': email,
            'user_message': message,
            'user_name': name,
          }
        }));

    setState(() {
      conformation = true;
    });
    //showAlertDialog(context);
  }

  Widget buildtextfield(
          {required title,
          required TextEditingController controller,
          required lines,
          required size}) =>
      Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.firaCode(
                fontSize: size.width / 45, color: Colors.white),
          ),
          TextField(
              maxLines: lines,
              style: TextStyle(color: Colors.white, fontSize: size.width / 60),
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))))
        ],
      );
}
