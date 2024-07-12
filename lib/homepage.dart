// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:trotters/default.dart';
import 'package:trotters/mongo.dart';
import 'package:trotters/route/routing.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ListView(
              children: [
                Container(
                  height: screenHeight / 2,
                  decoration: BoxDecoration(
                    gradient: appcolor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Get.toNamed(AppRoute.admin),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("asset/ronaldo.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Admin",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.calendar,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: DatePicker(
                    DateTime.now(),
                    height: 100,
                    width: 80,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.white,
                    selectedTextColor: Colors.black,
                    monthTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    dayTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    dateTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Live Match",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: screenHeight * 0.23,
                  width: screenWidth / 1.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Inter Department " +
                                  DateFormat.y().format(DateTime.now()),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat.yMMMMd().format(DateTime.now()),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: screenHeight * 0.08,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: Center(
                                child: Text(
                                  live_match[0]["TeamA"],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${live_match[0]["ScoreA"]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${live_match[0]["ScoreB"]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            Container(
                              height: screenHeight * 0.08,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Center(
                                child: Text(
                                  live_match[0]["TeamB"],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    shrinkWrap: true,
                    itemCount: completedMatch.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 30,
                                    width: screenWidth * 0.125,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        completedMatch[i]["TeamA"],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: screenWidth * 0.125,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        completedMatch[i]["TeamB"],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "${completedMatch[i]["ScoreA"]}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "${completedMatch[i]["ScoreB"]}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              Container(
                                height: screenHeight * 0.12,
                                color: Colors.grey,
                                width: 2,
                              ),
                              if (completedMatch[i]["ScoreA"] >
                                  completedMatch[i]["ScoreB"])
                                Text(
                                  "${completedMatch[i]["TeamA"]} Won",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                )
                              else if (completedMatch[i]["ScoreA"] ==
                                  completedMatch[i]["ScoreB"])
                                Text(
                                  "Match Draw",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold),
                                )
                              else
                                Text(
                                  "${completedMatch[i]["TeamB"]} Won",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List completedMatch = [
  {
    "TeamA": "CSBS",
    "ScoreA": 5,
    "TeamB": "Mect",
    "ScoreB": 0,
  },
  {
    "TeamA": "Mech",
    "ScoreA": 4,
    "TeamB": "Arch",
    "ScoreB": 4,
  },
  {
    "TeamA": "Cse",
    "ScoreA": 2,
    "TeamB": "IT",
    "ScoreB": 5,
  },
  {
    "TeamA": "EEE",
    "ScoreA": 3,
    "TeamB": "ECE",
    "ScoreB": 0,
  }
];
