import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MovieCatalogApp());
}

class MovieCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Thriller', 'imageUrl': 'https://ibb.co/wyNFQqp'},
    {'name': 'Action', 'imageUrl': 'https://ibb.co/7SB8RrR'},
    {'name': 'Horror', 'imageUrl': 'https://ibb.co/XknR9RC'},
    {'name': 'Romantic', 'imageUrl': 'https://ibb.co/0V26bQm'},
    {'name': 'Adventure', 'imageUrl': 'https://ibb.co/mbJh5Cj'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: category['imageUrl']!,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(category['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(category: category['name']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Movie {
  final String title;
  final String genre;
  final int releaseYear;
  final double rating;
  final List<String> casts;
  final String imageUrl;

  Movie({
    required this.title,
    required this.genre,
    required this.releaseYear,
    required this.rating,
    required this.casts,
    required this.imageUrl,
  });
}

class CategoryPage extends StatelessWidget {
  final String category;

  CategoryPage({required this.category});

  final List<Movie> movies = <Movie>[
    Movie(
      title: 'Hereditary',
      genre: 'Horror',
      releaseYear: 2018,
      rating: 7.3,
      casts: ['Toni Collette-Annie', 'Milly shapiro-Charlie', 'Gabriel Byrne-Steve','Alex Wolff-Peter','and many'],
      imageUrl: 'https://ibb.co/tpdtL9Z',
    ),
    Movie(
      title: 'The Conjuring',
      genre: 'Horror',
      releaseYear: 2013,
      rating: 7.5,
      casts: ['Patrick Wilson-Ed Warren', 'Vera Farmiga-Lorraine Warren'],
      imageUrl: 'https://ibb.co/rkgVFD4',
    ),
    Movie(
      title: 'The Gladiator',
      genre: 'Action',
      releaseYear: 2000,
      rating: 8.5,
      casts: ['Russell Crowe-Maximus', 'Joaquin Phoenix-commodus','Connie Nielsen-Lucillia'],
      imageUrl: 'https://ibb.co/D7Nxq9J',
    ),
    Movie(
      title: 'xXx',
      genre: 'Action',
      releaseYear: 2002,
      rating: 5.8,
      casts: ['vin Diesel-Xander Cage', 'Asia Argento-Yelena','Samuel L. Jackson-Agne Augustus Gibbons'],
      imageUrl:'https://ibb.co/7YgKPb1',
    ),
    Movie(
      title: 'The Call',
      genre: 'Thriller',
      releaseYear: 2020,
      rating: 7.1,
      casts: ['Park Shine-hye-Seo-yeon', 'Jeon Jong-seo-Young-sook', 'Lee El-Young-sooks mother'],
      imageUrl: 'https://ibb.co/XXhRqGT',
    ),
    Movie(
      title: 'Jumanji',
      genre: 'Adventure',
      releaseYear: 1995,
      rating: 8.0,
      casts: ['Robin Williams-Alan Parrish', 'Kirsten Dunst-Judy Shepherd', 'Bonnie Hunt-Sarah Whittle'],
      imageUrl: 'https://ibb.co/42Z6QWb',
    ),
    Movie(
        title: 'Journey to the center of the Earth',
        genre: 'Adventure',
        releaseYear: 2008,
        rating: 5.8,
        casts: ['Brendan Fraser-Trevor Anderson', "Josh Hutcherson-Sean anderson"],
        imageUrl: 'https://ibb.co/6trRbWZ',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: movie.imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(movie.title),
            subtitle: Text('${movie.genre} - ${movie.releaseYear}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView.builder(
        itemCount: movie.casts.length,
        itemBuilder: (context, index) {
          final cast = movie.casts[index];
          return ListTile(
            title: Text(cast),
            leading: Image.network(movie.imageUrl),

          );
        },
      ),
    );
  }
}
