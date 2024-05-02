import 'package:flutter/material.dart';

class BookmarkMovie extends StatefulWidget {
  const BookmarkMovie({super.key});

  @override
  State<BookmarkMovie> createState() => _BookmarkMovieState();
}

class _BookmarkMovieState extends State<BookmarkMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Text(
        'Bookmark'
      ),
    );
  }
}