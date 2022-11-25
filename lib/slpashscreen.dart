import 'package:flutter/material.dart';
import 'package:math_puzzel/first.dart';

class slpashscreen extends StatefulWidget {
  const slpashscreen({Key? key}) : super(key: key);

  @override
  State<slpashscreen> createState() => _slpashscreenState();
}

class _slpashscreenState extends State<slpashscreen> {
  @override
  void initState() {
    super.initState();
    screen();
  }

  screen() async {
   await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => first(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/blackboard_main_menu.png"), fit: BoxFit.fill),
          ),
          child: Container(
            child: Text("Math Puzzeles",
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 40,
                color: Colors.white,
                fontFamily: "f1",
                fontWeight: FontWeight.w600),),
          ),
        ),
      ),
    );
  }
}
