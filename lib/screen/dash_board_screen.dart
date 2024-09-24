import 'package:flutter/material.dart';

import 'chat_screen.dart';


class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  MediaQueryData? mqData;
  bool? isLight;

  List<Widget> navPages = [
    ChatScreen(),
    Container(),
    Container(),
    Container(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: navPages[selectedIndex],
      bottomNavigationBar: mqData!.orientation == Orientation.portrait ?NavigationBar(
        destinations: [
          NavigationDestination(
              selectedIcon: Icon(Icons.chat_sharp),
              icon: Icon(Icons.chat_outlined),
              label: "Chats"),
          NavigationDestination(
              selectedIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline_outlined),
              label: "Updates"),
          NavigationDestination(
              selectedIcon: Icon(Icons.people),
              icon: Icon(Icons.people_outline),
              label: "Communities"),
          NavigationDestination(
              selectedIcon: Icon(Icons.call),
              icon: Icon(Icons.call),
              label: "Calls"),
        ],
        selectedIndex: selectedIndex,
        indicatorColor: Colors.green.shade100,
        onDestinationSelected: (value){
          selectedIndex = value;
          setState(() {

          });
        },
      ):null,
    );
  }
}