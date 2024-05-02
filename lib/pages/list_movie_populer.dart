import 'package:flutter/material.dart';

class ListPopular extends StatefulWidget {
  const ListPopular({super.key});

  @override
  State<ListPopular> createState() => _ListPopularState();
}

class _ListPopularState extends State<ListPopular> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Text(
        'Popular'
      ),
    );
  }
}