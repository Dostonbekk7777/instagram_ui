import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_ui/pages/feed_page.dart';
import 'package:instagram_ui/pages/search_page.dart';
class HomePage extends StatefulWidget {
  static final String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage = 0;

  var _pages = [
    FeedPage(),
    SearchPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Instagram',style: TextStyle(fontSize: 24,color: Colors.black),),
        leading: IconButton(onPressed: (){},
        icon: Icon(Feather.camera,color: Colors.grey,),
          iconSize: 30,
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(FontAwesome.tv,color: Colors.grey,size: 30,)),
          IconButton(onPressed: (){}, icon: Icon(FontAwesome.send_o,color: Colors.grey,))
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _currentPage,
        onTap: (i){
          setState(() {
            _currentPage = i;
          });
        }, items: [
          BottomNavigationBarItem(icon: Icon(Foundation.home),
          label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Feather.search),
        label: "Search"),
        BottomNavigationBarItem(icon: Icon(Feather.plus_square),
            label: 'Upload'),
        BottomNavigationBarItem(icon: Icon(Feather.heart),
            label: "Likes"),
        BottomNavigationBarItem(icon: Icon(Feather.user),
            label: "User"),
      ],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
