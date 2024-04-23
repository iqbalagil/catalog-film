import 'package:flutter/material.dart';
import 'package:flutter_application_listmovie/common/color_widget.dart';
import 'package:flutter_application_listmovie/pages/list_movie.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme:
         ThemeData(
          scaffoldBackgroundColor: Tcolor.white,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
    const MyHomePage({super.key});
  
    @override
    Widget build(BuildContext context) {
      return const MovieList();
    }
  }

