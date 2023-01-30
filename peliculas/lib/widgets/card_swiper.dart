import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (this.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity, //toma todo el espacio del padre
      height: size.height * 0.5,
      child: Swiper(
        // paquete de importacion
        itemCount: movies.length, // cantidad de tarjetas
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          movie.heroID = 'swiper-${movie.id}';
          return GestureDetector(
            // permite hacer el onTap en la pelicula seleccionada y me lleva a otra pantalla
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroID!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage(
                      'assets/no-image.jpg'), //se ve mientras carga la imagen
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit
                      .cover, //adaptar la imagen al tamaño del contenedor padre
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
