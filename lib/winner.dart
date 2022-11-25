import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_puzzel/continues.dart';
import 'package:math_puzzel/first.dart';

class winner extends StatefulWidget {
  int index;

  winner(this.index);

  @override
  State<winner> createState() => _winnerState();
}

class _winnerState extends State<winner> {
  @override
  Widget build(BuildContext context) {
    double topside = MediaQuery.of(context).size.height;
    double statusbar = MediaQuery.of(context).padding.top;
    double screen_size = topside - statusbar;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusbar),
        height: screen_size,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.bottomCenter,
                child: Text(
                    "Puzzel ${widget.index + 1} completed".toUpperCase(),
                    style: GoogleFonts.charm(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff404da9),
                        fontSize: 25)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "image/trophy.png",
                      ),
                      scale: 2.5),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            colors: [
                              (Color(0xFF37474F)),
                              (Color(0x8AFFFFFF)),
                              (Color(0xFF37474F)),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => continues(widget.index++),
                            )),
                        child: Text("Continue".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.charm(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            colors: [
                              (Color(0xFF37474F)),
                              (Color(0x8AFFFFFF)),
                              (Color(0xFF37474F)),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => first(),));
                        },
                        child: Text("main menu".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.charm(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            colors: [
                              (Color(0xFF37474F)),
                              (Color(0x8AFFFFFF)),
                              (Color(0xFF37474F)),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                      child: InkWell(
                        child: Text("buy pro".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.charm(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      child: Text("share this puzzle".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.charm(
                              color: Color(0xff404da9),
                              fontSize: 25,
                              fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      // alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/shareus.png"),
                          scale: 20,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        gradient: LinearGradient(
                            colors: [
                              (Color(0xFF37474F)),
                              (Color(0x8AFFFFFF)),
                              (Color(0xFF37474F)),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                    ),
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
