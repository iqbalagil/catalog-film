import 'package:flutter/material.dart';
import 'package:flutter_application_listmovie/models/movie.dart';
import 'package:flutter_application_listmovie/common/color_widget.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

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
        title: Text(
          movie.title,
          style: TextStyle(color: Tcolor.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(120)),
                color: Tcolor.primaryColor2,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(120)),
                child: Image.network(
                  path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Overview',
                style: TextStyle(
                  color: Tcolor.primaryColor1,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movie.overview,
                style: TextStyle(
                  color: Tcolor.secondaryColor1,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
