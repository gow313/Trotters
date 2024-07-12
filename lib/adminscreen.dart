import 'package:flutter/material.dart';
import 'package:trotters/default.dart';

class Adminscreen extends StatefulWidget {
  const Adminscreen({super.key});

  @override
  State<Adminscreen> createState() => _AdminscreenState();
}

class _AdminscreenState extends State<Adminscreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: screenWidth,
          decoration: BoxDecoration(gradient: appcolor),
          child: Column(
            children: [
              Text(
                "Login Screen",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "UserName",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Container(
                    width: screenWidth / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(3)),
                    child: Center(
                        child: TextFormField(
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
