import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trotters/homepage.dart';
import 'package:trotters/leaderboardscreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<homeScreen> {
  int _selectedIndex = 0;

  final _pages = [
    homePage(),
    leaderBoard(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            buildNavItem(Iconsax.home, '', 0),
            buildNavItem(Icons.scoreboard_outlined, '', 1),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: _selectedIndex == index ? buildSelectedIcon(icon) : Icon(icon),
      label: label,
    );
  }

  Widget buildSelectedIcon(IconData icon) {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildCircle(),
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ],
    );
  }

  Widget buildCircle() {
    return Container(
      width: 50,
      height: 50,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: homeScreen(),
  ));
}
