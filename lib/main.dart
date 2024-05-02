import 'package:flutter/material.dart';
import 'package:flutter_application_listmovie/common/color_widget.dart';
import 'package:flutter_application_listmovie/models/movie.dart';
import 'package:flutter_application_listmovie/pages/list_bookmark_movie.dart';
import 'package:flutter_application_listmovie/pages/list_movie_populer.dart';
import 'package:flutter_application_listmovie/pages/movie_detail.dart';
import 'package:flutter_application_listmovie/widget/navigation_bar.dart';
import 'package:flutter_application_listmovie/pages/list_movie.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

        backgroundColor: Tcolor.secondaryColor1,
        title: const Text(
          "EIGA",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
        body: _getScreen(_selectedIndex),
        bottomNavigationBar: Navbar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

  Widget _getScreen(int index) {
    switch(index) {
      case 0:
      return const MovieList();
      case 1:
      return const ListPopular();
      case 2:
      return const BookmarkMovie();
      default:
      return const MovieList();
    }
  }
