import 'package:flutter/material.dart';
import 'package:shopping_app/pages/main_pages/home_screen/home_screen.dart';

Widget buildScreen(int index) {
  List<Widget> _widgets = [
    HomeScreen(),
    Center(
      child: Text('search page'),
    ),
    Center(
      child: Text('itme page'),
    ),
    Center(
      child: Text('chat page'),
    ),
    Center(
      child: Text('profile page'),
    ),
  ];
  return _widgets[index];
}

var bottomTabs = const [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
  ),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
  BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
  BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: "Chats"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
];
