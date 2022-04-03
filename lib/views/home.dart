import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_app/views/add_record.dart';
import 'package:weight_tracker_app/views/graph.dart';
import 'package:weight_tracker_app/views/history.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  Widget _currentScreen = GraphScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("TRACK YOUR WEIGHT")),
      body: _currentScreen,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.black,
          onPressed: () {
            Get.to(() => AddRecordView());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: Get.height / 15,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.black,
        gapLocation: GapLocation.center,
        icons: const [Icons.show_chart, Icons.history],
        iconSize: 30,
        activeIndex: _currentTab,
        onTap: (int) {
          setState(() {
            _currentTab = int;
            _currentScreen = (int == 0) ? GraphScreen() : HistoryScreen();
          });
          print('Current tab: $_currentTab');
        },
      ),
    );
  }
}
