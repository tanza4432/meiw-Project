import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';
import 'package:hospitel/mainboard/screen/home_screen.dart';
import 'package:hospitel/mainboard/screen/location.dart';
import 'package:hospitel/mainboard/screen/profile.dart';

class dashboardScreen extends StatefulWidget {
  dashboardScreen(this.token, this.fullname, this.email, this.page);
  final token;
  final fullname;
  final email;
  var page;
  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  List _screensUsers(token, fullname, email) => [
        HomeScreen(),
        Location(),
        ProfilePage(token, fullname, email),
      ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screensUsers(
          widget.token, widget.fullname, widget.email)[widget.page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.page,
        onTap: (index) => setState(() => widget.page = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.map, Icons.account_box]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: widget.page == key
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
