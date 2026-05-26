import 'package:movies/data/database/models/database_models.dart';
import 'package:movies/data/database/database_interface.dart';
import 'package:movies/data/database/drift/movie_database.dart';

class DriftDatabase implements IDatabase {
  final MovieDatabase movieDatabase = MovieDatabase();

  DriftDatabase();

  @override
  Future deleteDatabase() async {}

  @override
  Future<List<DBFavorite>> getFavorites() async {
    final rows = await movieDatabase.managers.driftFavorite.get();
    return rows.map((r) => DBFavorite(
      id: r.id,
      movieId: r.movieId,
      backdropPath: r.backdropPath,
      posterPath: r.posterPath,
      favorite: r.favorite,
      popularity: r.popularity,
      releaseDate: r.releaseDate,
      title: r.title,
      overview: r.overview,
    )).toList();
  }

  @override
  Future<List<DBMovieGenre>> getGenres() async {
    final genres = await movieDatabase.managers.driftGenre.get();
    final dbGenres = <DBMovieGenre>[];
    for (final genre in genres) {
      dbGenres.add(DBMovieGenre(
        id: genre.id,
        remoteId: genre.remoteId,
        name: genre.name,
      ));
    }
    return dbGenres;
  }

  @override
  Future<DBConfiguration?> getMovieConfiguration() async {
    final images = await movieDatabase.managers.driftConfigurationImages.get();
    final dbImages = <DBConfigurationImages>[];
    for (final genre in images) {
      dbImages.add(DBConfigurationImages(
        baseUrl: genre.baseUrl,
        secureBaseUrl: genre.secureBaseUrl,
        backdropSizes: genre.backdropSizes.split(','),
        logoSizes: genre.logoSizes.split(','),
        posterSizes: genre.posterSizes.split(','),
        profileSizes: genre.profileSizes.split(','),
        stillSizes: genre.stillSizes.split(','),
      ));
    }
    if (dbImages.isEmpty) {
      return null;
    }
    return DBConfiguration(id: 1, images: dbImages[0], changeKeys: []);
  }

  @override
  Future<DBConfiguration?> getMovieConfigurationById(int id) async {
    return getMovieConfiguration();
  }

  @override
  Future<bool> removeFavorite(int movieId) async {
    final count = await movieDatabase.managers.driftFavorite
        .filter((f) => f.movieId(movieId))
        .delete();
    return count > 0;
  }

  @override
  Future saveFavorite(DBFavorite favorite) async {
    await movieDatabase.managers.driftFavorite.create(
      (_) => DriftFavoriteCompanion.insert(
        movieId: favorite.movieId,
        backdropPath: favorite.backdropPath,
        posterPath: favorite.posterPath,
        favorite: favorite.favorite,
        popularity: favorite.popularity,
        releaseDate: favorite.releaseDate,
        title: favorite.title,
        overview: favorite.overview,
      ),
    );
  }

  @override
  Future saveGenres(List<DBMovieGenre> genres) async {
    for (final genre in genres) {
      movieDatabase.managers.driftGenre.create((x) => DriftGenreData(
          id: genre.id, remoteId: genre.remoteId, name: genre.name));
    }
  }

  @override
  Future saveMovieConfiguration(DBConfiguration configuration) async {
    movieDatabase.managers.driftConfigurationImages
        .create((x) => DriftConfigurationImagesCompanion.insert(
              baseUrl: configuration.images.baseUrl,
              secureBaseUrl: configuration.images.secureBaseUrl,
              backdropSizes: configuration.images.backdropSizes.join(','),
              logoSizes: configuration.images.logoSizes.join(','),
              posterSizes: configuration.images.posterSizes.join(','),
              profileSizes: configuration.images.profileSizes.join(','),
              stillSizes: configuration.images.stillSizes.join(','),
            ));
  }

  @override
  Stream<List<DBFavorite>> streamFavorites() {
    return movieDatabase.managers.driftFavorite.watch().map((rows) =>
        rows.map((r) => DBFavorite(
              id: r.id,
              movieId: r.movieId,
              backdropPath: r.backdropPath,
              posterPath: r.posterPath,
              favorite: r.favorite,
              popularity: r.popularity,
              releaseDate: r.releaseDate,
              title: r.title,
              overview: r.overview,
            )).toList());
  }
}
