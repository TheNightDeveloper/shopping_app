import 'package:flutter/material.dart';

Widget buildScreen(int index) {
  List<Widget> _widgets = [
    Center(
      child: Text('home page'),
    ),
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
