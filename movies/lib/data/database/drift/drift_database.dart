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
    final favorites =
        await movieDatabase.select(movieDatabase.driftFavorite).get();
    return favorites
        .map((favorite) => DBFavorite(
              id: favorite.id,
              movieId: favorite.movieId,
              backdropPath: favorite.backdropPath,
              posterPath: favorite.posterPath,
              favorite: favorite.favorite,
              popularity: favorite.popularity,
              releaseDate: favorite.releaseDate,
              title: favorite.title,
              overview: favorite.overview,
            ))
        .toList();
  }

  @override
  Future<List<DBMovieGenre>> getGenres() async {
    final genres = await movieDatabase.select(movieDatabase.driftGenre).get();
    return genres
        .map((genre) => DBMovieGenre(
              id: genre.id,
              remoteId: genre.remoteId,
              name: genre.name,
            ))
        .toList();
  }

  @override
  Future<DBConfiguration?> getMovieConfiguration() async {
    final images = await movieDatabase
        .select(movieDatabase.driftConfigurationImages)
        .get();
    final dbImages = <DBConfigurationImages>[];
    for (final image in images) {
      dbImages.add(DBConfigurationImages(
        baseUrl: image.baseUrl,
        secureBaseUrl: image.secureBaseUrl,
        backdropSizes: image.backdropSizes.split(','),
        logoSizes: image.logoSizes.split(','),
        posterSizes: image.posterSizes.split(','),
        profileSizes: image.profileSizes.split(','),
        stillSizes: image.stillSizes.split(','),
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
  Future<bool> removeFavorite(int id) async {
    final affectedRows =
        await (movieDatabase.delete(movieDatabase.driftFavorite)
              ..where((tbl) => tbl.id.equals(id)))
            .go();
    return affectedRows > 0;
  }

  @override
  Future saveFavorite(DBFavorite favorite) async {
    final existingFavorite =
        await (movieDatabase.select(movieDatabase.driftFavorite)
              ..where((tbl) => tbl.movieId.equals(favorite.movieId)))
            .getSingleOrNull();

    final companion = DriftFavoriteCompanion.insert(
      movieId: favorite.movieId,
      backdropPath: favorite.backdropPath,
      posterPath: favorite.posterPath,
      favorite: favorite.favorite,
      popularity: favorite.popularity,
      releaseDate: favorite.releaseDate,
      title: favorite.title,
      overview: favorite.overview,
    );

    if (existingFavorite != null) {
      await (movieDatabase.update(movieDatabase.driftFavorite)
            ..where((tbl) => tbl.id.equals(existingFavorite.id)))
          .write(companion);
      return;
    }

    await movieDatabase.into(movieDatabase.driftFavorite).insert(companion);
  }

  @override
  Future saveGenres(List<DBMovieGenre> genres) async {
    for (final genre in genres) {
      await movieDatabase.into(movieDatabase.driftGenre).insert(
            DriftGenreCompanion.insert(
              remoteId: genre.remoteId,
              name: genre.name,
            ),
          );
    }
  }

  @override
  Future saveMovieConfiguration(DBConfiguration configuration) async {
    await movieDatabase.into(movieDatabase.driftConfigurationImages).insert(
          DriftConfigurationImagesCompanion.insert(
            baseUrl: configuration.images.baseUrl,
            secureBaseUrl: configuration.images.secureBaseUrl,
            backdropSizes: configuration.images.backdropSizes.join(','),
            logoSizes: configuration.images.logoSizes.join(','),
            posterSizes: configuration.images.posterSizes.join(','),
            profileSizes: configuration.images.profileSizes.join(','),
            stillSizes: configuration.images.stillSizes.join(','),
          ),
        );
  }

  @override
  Stream<List<DBFavorite>> streamFavorites() {
    return movieDatabase.select(movieDatabase.driftFavorite).watch().map(
          (favorites) => favorites
              .map((favorite) => DBFavorite(
                    id: favorite.id,
                    movieId: favorite.movieId,
                    backdropPath: favorite.backdropPath,
                    posterPath: favorite.posterPath,
                    favorite: favorite.favorite,
                    popularity: favorite.popularity,
                    releaseDate: favorite.releaseDate,
                    title: favorite.title,
                    overview: favorite.overview,
                  ))
              .toList(),
        );
  }
}
