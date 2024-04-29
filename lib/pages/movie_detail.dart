import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_listmovie/models/movie.dart';
import 'package:flutter_application_listmovie/common/color_widget.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  const MovieDetail(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          "https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg";
    }
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.secondaryColor1,
        
        iconTheme: IconThemeData(color: Tcolor.primaryColor1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            Container(
              width: 450,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  stops: const [0 , 0.5, 1.0],
                  colors: [Tcolor.secondaryColor1,Tcolor.primaryColor2,Tcolor.secondaryColor1],
                )
                
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 100,left: 10),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500
                    ),
                  ),
              ),
            ),

            const SizedBox(width: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [Card(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10), top: Radius.circular(10)),
                  color: Tcolor.primaryColor2,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10), top: Radius.circular(10)),
                  child: Image.network(
                    path,
                    height: height * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    strutStyle: const StrutStyle(fontSize: 12),
                    text: TextSpan(
                      style: TextStyle(color: Tcolor.secondaryColor1,fontWeight: FontWeight.w700),
                      text: movie.overview,
                    ),
                  ),
                ),
              ),
            ]
              ),
          ],
        ),
      ),
    );
  }
}
