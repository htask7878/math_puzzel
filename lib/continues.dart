
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_puzzel/model.dart';
import 'package:math_puzzel/winner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class continues extends StatefulWidget {
  int index;

  continues(this.index);

  @override
  State<continues> createState() => _continuesState();
}

class _continuesState extends State<continues> {
  String n_string = "";
  DateTime current_time = DateTime.now();

  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    set();
  }

  set() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image/gameplaybackground.jpg"),
                  fit: BoxFit.fill)),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          DateTime nowtime = DateTime.now();
                          if(model.time_string=="")
                          {
                            model.time_string="${nowtime}";
                            alert();
                          }else {
                            current_time= nowtime;
                            Duration duration=current_time.difference(DateTime.parse(model.time_string));
                            int min = duration.inMinutes;

                            if(min<=1)
                              {
                                showDialog(barrierDismissible: false,
                                    builder: (context) {
                                  return AlertDialog(title: Text("Skip"),
                                    content: Text("You Can Skip This Level After 2 Minutes."),
                                    actions: [
                                      TextButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, child:Text("OK"))
                                    ],
                                  );
                                },context: context);
                              }else{
                              alert();
                              model.time_string="${current_time}";
                              min =0;
                            }
                          }

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                            "image/skip.png",
                          )),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "image/level_board.png",
                            ),
                            fit: BoxFit.fill),
                      ),
                      child: Text(
                        "Puzzel ${widget.index + 1}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.charm(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/hint.png"),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                              builder: (context) => AlertDialog(
                                    title: Text("Hint"),
                                    content: Text(
                                        "Try The Solve Right Answer Use Your Brain."),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                            color: Colors.pinkAccent,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(primary: Colors.white12),
                                      ),
                                    ],
                                  ),
                              context: context);
                          print("hardik beladiya1");
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("${model.q_image[widget.index]}"),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 120,
                  color: Colors.black,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Text("${n_string}",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.charm(
                                      fontSize: 15, color: Colors.black)),
                            ),
                            Container(
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("image/delete.png"))),
                              child: InkWell(
                                onTap: () => setState(() {
                                  if (n_string != "") {
                                    n_string = n_string.substring(
                                        0, n_string.length - 1);
                                  }
                                }),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.lime,
                                    primary: Colors.white10,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (n_string == model.ans[widget.index]) {
                                        prefs!.setString("level_status${model.current_level}", "yes");
                                        model.current_level++;
                                        prefs!.setInt("levelno", model.current_level);
                                        print("ans is true...");
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => winner(widget.index),
                                            ));
                                      } else {
                                        n_string = "";
                                        Fluttertoast.showToast(
                                            msg: "answer wrong!..",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor: Color(0xffe8dec4),
                                            textColor: Colors.black45,
                                            fontSize: 16.0
                                        );

                                        print("ans is false...");
                                      }
                                    });
                                  },
                                  child: Text(
                                    "submit".toUpperCase(),
                                    style: GoogleFonts.charm(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            button(1),
                            button(2),
                            button(3),
                            button(4),
                            button(5),
                            button(6),
                            button(7),
                            button(8),
                            button(9),
                            button(0),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ),
      ),
    );
  }

  button(int i) {
    return Container(
      width: 30,
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: Color(0xffECE0B7C5),
            primary: Colors.white10,
          ),
          onPressed: () => setState(() {
                n_string = n_string + i.toString();
              }),
          child: Text(
            "${i}",
            style: GoogleFonts.charm(color: Colors.white),
            textAlign: TextAlign.center,
          )),
    );
  }

  alert()
  {
    return showDialog(
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Skip"),
          content: Text(
              "Are you sure you want to skip this level? "
                  "You can play skipped leves later by clicking "
                  "on PUZZLES menu from main screen."),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "CANCEL",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                  ),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.white12)),
            TextButton(
                onPressed: () => setState(() {
                  model.current_level++;
                  prefs!.setString("level_status${model.current_level}", "skip");
                  prefs!.setInt("levelno", model.current_level);

                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // if(duration1.inMinutes) {}
                        // if (old_time.isAfter(
                        //     current_time)) {
                        //   print(
                        //       "different  1= ${old_time.difference(current_time)}");
                        //   print("hello");
                        // } else if (old_time
                        //     .isBefore(
                        //         current_time)) {
                        //   print(
                        //       "different 2 = ${current_time.difference(current_time)}");
                        // } else {
                        //   print("Hardik Beladiyta");
                        // }
                        return continues(model.current_level);
                      },
                    ),
                  );
                }),
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                  ),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.amber)),
          ],
        ),
        context: context);
  }
}
