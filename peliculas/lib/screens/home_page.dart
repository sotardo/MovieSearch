import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movies.provider.dart';
import '../search/shearch_delegate.dart';
import '../widgets/card_swiper.dart';
import '../widgets/movie_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // centrar el titulo
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: MovieSearchDelegate(),
            ),
            icon: const Icon(Icons.search_outlined),
          )
        ],
        title: const Text(
          'Películas en cines',
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // permite hacer scroll
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            // Slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
