import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'movie_database.g.dart';

class DriftConfigurationImages extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get baseUrl => text()();

  TextColumn get secureBaseUrl => text()();

  TextColumn get backdropSizes => text()();

  TextColumn get logoSizes => text()();

  TextColumn get posterSizes => text()();

  TextColumn get profileSizes => text()();

  TextColumn get stillSizes => text()();
}

class DriftFavorite extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get movieId => integer()();

  TextColumn get backdropPath => text()();

  TextColumn get posterPath => text()();

  BoolColumn get favorite => boolean()();

  RealColumn get popularity => real()();

  DateTimeColumn get releaseDate => dateTime()();

  TextColumn get title => text()();

  TextColumn get overview => text()();
}

class DriftGenre extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get remoteId => integer()();

  TextColumn get name => text()();
}

@DriftDatabase(
  tables: [DriftFavorite, DriftConfigurationImages, DriftGenre],
)
class MovieDatabase extends _$MovieDatabase {
  MovieDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'Movies.db'));
    return NativeDatabase.createInBackground(file);
  });
}
