import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_puzzel/continues.dart';
import 'package:math_puzzel/model.dart';

class puzzles2 extends StatefulWidget {
  List level_status = [];

  puzzles2(this.level_status);

  @override
  State<puzzles2> createState() => _puzzles2State();
}

class _puzzles2State extends State<puzzles2> {
  @override
  Widget build(BuildContext context) {
    double topside = MediaQuery.of(context).size.height;
    double statusbar = MediaQuery.of(context).padding.top;
    double screen_size = topside - statusbar;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusbar),
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
            Container(
              height: 50,
              // alignment: Alignment.bottomCenter,
              child: Text("Select Puzzle",
                  style: GoogleFonts.charm(
                      color: Color(0xff404da9),
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
            ),
            Expanded(
              flex: 9,
              child: Container(
                height: 400,
                margin: EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: model.q_image.length,
                  itemBuilder: (context, index) => Container(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: (widget.level_status[index] == "skip" ||
                              index == 0)
                          ? BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(width: 2, color: Colors.black45),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            )
                          : (widget.level_status[index] == "yes" || index == 0)
                              ? BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all(
                                      width: 2, color: Colors.black45),
                                  image: DecorationImage(
                                    image: AssetImage("image/tick.png"),
                                  ),
                                )
                              : BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage("image/lock.png"),
                                  ),
                                ),
                      child: InkWell(
                        child: (widget.level_status[index] == "yes" ||
                                index == 0 ||
                                widget.level_status[index] == "skip")
                            ? Text(
                                "${index + 1}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "f1",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              )
                            : null,
                        // onTap: (index< model.current_level)
                        //     ? () {
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => continues(index),
                        //       ));
                        // }
                        //     : null,
                        // TODO second method
                        onTap: (widget.level_status[index] == "yes" ||
                                widget.level_status[index] == "skip" ||
                                index == 0)
                            ? () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => continues(index),
                                  ),
                                )
                            : null,
                      ),
                    ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    // SizedBox(
                    //   width: 250,
                    // ),
                    // Container(
                    //   width: 80,
                    //   // decoration: BoxDecoration(
                    //   // color: Colors.yellow,
                    //   //     image: DecorationImage(
                    //   //   image: AssetImage("image/next.png"),
                    //   //   scale: 10,
                    //   //   alignment: Alignment.centerRight,
                    //   // )),
                    //   // child: InkWell(),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
