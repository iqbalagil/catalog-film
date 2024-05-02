import 'package:flutter/material.dart';
import 'package:flutter_application_listmovie/models/movie.dart';
import 'package:flutter_application_listmovie/common/color_widget.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';
  final Map<int, String> genreMap = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western"
  };

   MovieDetail(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path = "https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg";
    }
    double height = MediaQuery.of(context).size.height;

    // Building genre cards
    List<Widget> genreCards = movie.genreIds.map((genreId) => Card(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          genreMap[genreId] ?? "Unknown",  // Use genre map to get genre names
          style: TextStyle(color: Colors.white),
        ),
      ),
      color: Tcolor.primaryColor2,
    )).toList();

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
                  stops: const [0, 0.5, 1.0],
                  colors: [Tcolor.secondaryColor1, Tcolor.primaryColor2, Tcolor.secondaryColor1],
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 10),
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
            // Inserting genre cards here
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: genreCards,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                        top: Radius.circular(10)
                      ),
                      color: Tcolor.primaryColor2,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                        top: Radius.circular(10)
                      ),
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
                        style: TextStyle(color: Tcolor.secondaryColor1, fontWeight: FontWeight.w700),
                        text: movie.overview,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
