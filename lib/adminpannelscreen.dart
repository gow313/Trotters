import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trotters/constant.dart';
import 'package:trotters/default.dart';
import 'package:trotters/mongo.dart';
import 'package:trotters/route/routing.dart';

class Adminpannelscreen extends StatefulWidget {
  const Adminpannelscreen({super.key});

  @override
  State<Adminpannelscreen> createState() => _AdminpannelscreenState();
}

class _AdminpannelscreenState extends State<Adminpannelscreen> {
  final teamA = TextEditingController();
  final teamB = TextEditingController();
  final ScoreA = TextEditingController();
  final ScoreB = TextEditingController();
  final pool = TextEditingController();

  bool isNew = false;
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
            padding: EdgeInsetsDirectional.only(top: 40),
            children: [
              Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: InkWell(
                    onTap: () async {
                      await MongoDatabase.completedMatch();
                      Get.offNamed(AppRoute.home);
                    },
                    child: Container(
                      height: 50,
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: Center(
                          child: Text(
                        "Completed",
                        style: GoogleFonts.dmSans(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isNew = !isNew;
                  });
                },
                child: Align(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                      height: 50,
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      child: Center(
                          child: Text(
                        "Update Match",
                        style: GoogleFonts.dmSans(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              isNew
                  ? SizedBox(
                      height: 10,
                    )
                  : Column(
                      children: [
                        Text(
                          "TeamA",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 50,
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: Center(
                                  child: TextFormField(
                                controller: teamA,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "TeamB",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 50,
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: Center(
                                  child: TextFormField(
                                controller: teamB,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "ScoreA",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 50,
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: Center(
                                  child: TextFormField(
                                controller: ScoreA,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "ScoreB",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 50,
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: Center(
                                  child: TextFormField(
                                controller: ScoreB,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Pool",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 50,
                              width: screenWidth * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: Center(
                                  child: TextFormField(
                                controller: pool,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            statu();
                            Get.offNamed(AppRoute.home);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Container(
                                padding: EdgeInsets.only(left: 5),
                                height: 50,
                                width: screenWidth * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Center(
                                    child: Text(
                                  "Update",
                                  style: TextStyle(color: Colors.black),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void statu() async {
    await MongoDatabase.match!.insert({
      'teamA': teamA.text,
      'teamB': teamB.text,
      'ScoreA': ScoreA.text,
      'ScoreB': ScoreB.text,
      'pool': pool.text
    });
    teamA.clear();
    teamB.clear();
    ScoreA.clear();
    ScoreB.clear();
    pool.clear();
  }
}
