import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_puzzel/continues.dart';
import 'package:math_puzzel/model.dart';
import 'package:math_puzzel/puzzles2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  bool clk_border = false;
  bool clk_border1 = false;
  SharedPreferences? pref;
  List<String> level_status = [];

  @override
  void initState() {
    level_status = List.filled(model.ans.length, "no");
    get();
  }
  get() async {
    pref = await SharedPreferences.getInstance();
    model.current_level = pref!.getInt("levelno") ?? 0;

    for (int j = 0; j < level_status.length; j++) {
      level_status[j] = pref!.getString("level_status$j") ?? "no";
    }
    print(level_status);
  }

  @override
  Widget build(BuildContext context) {
    double topside = MediaQuery.of(context).size.height;
    double statusbar = MediaQuery.of(context).padding.top;
    double screen_size = topside - statusbar;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screen_size,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/background.jpg"), fit: BoxFit.fill),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    "Math Puzzle",
                    style: GoogleFonts.charm(fontSize: 30),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  // ignore: sort_child_properties_last
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: (clk_border == true)
                                    ? Colors.grey
                                    : Colors.black),
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(17))),
                        child: GestureDetector(
                          onTapUp: (details) {
                            setState(() {
                              clk_border = false;
                            });
                            print(" on Tap");
                          },
                          onTapCancel: () {
                            setState(() {
                              clk_border = false;
                            });
                            print("top cancel");
                          },
                          onTapDown: (details) {
                            setState(() {
                              clk_border = true;
                            });
                            print("top Tap down");
                          },
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          continues(model.current_level),
                                    ));
                              },
                              child: Text(
                                "continue".toUpperCase(),
                                style: TextStyle(
                                    letterSpacing: 3,
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontFamily: "f1",
                                    fontWeight: FontWeight.w600),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.white70,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: (clk_border1 == true)
                                    ? Colors.grey
                                    : Colors.black),
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(17))),
                        child: GestureDetector(
                          onTapUp: (details) {
                            setState(() {
                              clk_border1 = false;
                            });
                            print(" on Tap");
                          },
                          onTapCancel: () {
                            setState(() {
                              clk_border1 = false;
                            });
                            print("top cancel");
                          },
                          onTapDown: (details) {
                            setState(() {
                              clk_border1 = true;
                            });
                            print("top Tap down");
                          },
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return puzzles2(level_status);
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Puzzles".toUpperCase(),
                                style: TextStyle(
                                    letterSpacing: 3,
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontFamily: "f1",
                                    fontWeight: FontWeight.w600),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.white70,
                              )),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Buy Pro".toUpperCase(),
                            style: TextStyle(
                                letterSpacing: 3,
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: "f1",
                                fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.white70,
                          )),
                    ],
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("image/blackboard_main_menu.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                // alignment: Alignment.center,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
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
                              (Colors.grey),
                              (Colors.white),
                              (Colors.grey)
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/emailus.png"),
                          scale: 1.8,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        gradient: LinearGradient(
                            colors: [
                              (Colors.grey),
                              (Colors.white),
                              (Colors.grey)
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.amber,
                height: 40,
                width: 150,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Privacy Policy",
                      style: GoogleFonts.charm(
                          fontSize: 15,
                          letterSpacing: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.black12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))),
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
