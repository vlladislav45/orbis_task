import 'package:flutter/material.dart';
import 'package:orbis_task/presentation/widgets/home_screen_header.dart';
import 'package:orbis_task/presentation/widgets/timeline_taskmanager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 30, 8.0, 0),
          child: Column(
            children: const <Widget>[
              HomeScreenHeader(),
              SizedBox(height: 20.0),
              TimelineTaskManager(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home, color: Colors.grey[600]),
            activeIcon: const Icon(Icons.home_filled, color: Colors.black),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.calendar_today, color: Colors.grey[600]),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.message, color: Colors.grey[600]),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.analytics, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
