import 'package:flutter/material.dart';
import 'package:flutter_application_listmovie/common/color_widget.dart';
import 'package:flutter_application_listmovie/service/http_service.dart';
import 'package:flutter_application_listmovie/models/movie.dart';
import 'package:flutter_application_listmovie/pages/movie_detail.dart';
import 'package:flutter_application_listmovie/widget/navigation_bar.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List<Movie> movies = [];
  HttpService service = HttpService();
  bool isHovered = false;

  Future<void> initialize() async {
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),

        backgroundColor: Tcolor.secondaryColor1,
        title: const Text(
          "Popular Movies",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 2,
                  shadowColor: Colors.black12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movies[position].posterPath}',
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                ),

                const SizedBox(width: 16),

                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies[position].title,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                              movies[position].voteAverage.toStringAsFixed(1),
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyMedium!.color,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MovieDetail(movies[position])),
                          );
                        },
                        child: Text(
                          'Read More',
                          style: TextStyle(
                            color: isHovered ? Colors.black : Tcolor.secondaryColor1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // bottomNavigationBar: const Navbar(),
    );
  }
}
