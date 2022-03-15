import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/mainboard/screen/home_screen.dart';
import 'package:hospitel/mainboard/screen/location.dart';
import 'package:hospitel/mainboard/screen/patient_Information.dart';
import 'package:hospitel/mainboard/screen/patient_notification.dart';

class dashboardScreen extends StatefulWidget {
  dashboardScreen(this.type);
  String type;
  @override
  _dashboardScreenState createState() => _dashboardScreenState(type);
}

class _dashboardScreenState extends State<dashboardScreen> {
  _dashboardScreenState(this.type);
  String type;
  final List _screensHospital = [
    HomeScreen(),
    Location(),
    patient_Information(),
    patient_notification(),
  ];

  final List _screensUsers = [
    HomeScreen(),
    Location(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return type == "hospital"
        ? Scaffold(
            body: _screensHospital[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              elevation: 0.0,
              items: [Icons.home, Icons.map, Icons.event_note, Icons.info]
                  .asMap()
                  .map((key, value) => MapEntry(
                        key,
                        BottomNavigationBarItem(
                          title: Text(''),
                          icon: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 16.0,
                            ),
                            decoration: BoxDecoration(
                              color: _currentIndex == key
                                  ? ColorBackground
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(value),
                          ),
                        ),
                      ))
                  .values
                  .toList(),
            ),
          )
        : Scaffold(
            body: _screensUsers[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              elevation: 0.0,
              items: [Icons.home, Icons.map]
                  .asMap()
                  .map((key, value) => MapEntry(
                        key,
                        BottomNavigationBarItem(
                          title: Text(''),
                          icon: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 16.0,
                            ),
                            decoration: BoxDecoration(
                              color: _currentIndex == key
                                  ? ColorBackground
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(value),
                          ),
                        ),
                      ))
                  .values
                  .toList(),
            ),
          );
  }
}
