import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trotters/default.dart';
import 'package:trotters/route/routing.dart';

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
          child: ListView(
            padding: EdgeInsetsDirectional.only(top: 50),
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login Screen",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "UserName",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      width: screenWidth / 1.5,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(3)),
                      child: Center(
                          child: TextFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          width: screenWidth / 1.5,
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                              child: TextFormField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.adminpannel);
                      },
                      child: Container(
                        height: 50,
                        width: screenWidth / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green),
                        child: Center(
                            child: Text(
                          "Login",
                          style: GoogleFonts.dmSans(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
