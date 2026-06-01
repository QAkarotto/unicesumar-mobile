import 'package:flutter_test/flutter_test.dart';
import 'package:movies/utils/utils.dart';
import 'package:movies/data/models/movie_configuration.dart';

void main() {
  group('Utils unit tests', () {
    test('imageUrl composes correctly', () {
      final url = imageUrl('https://base/', 'size/', 'file.jpg');
      expect(url, 'https://base/size/file.jpg');
    });

    test('youtube helpers', () {
      expect(youtubeImageFromId('ABC'),
          'https://img.youtube.com/vi/ABC/hqdefault.jpg');
      expect(youtubeUrlFromId('XYZ'), 'https://www.youtube.com/watch?v=XYZ');
    });

    test('getSizedImageUrl returns correct poster sizes', () {
      final images = MovieConfigurationImages(
        baseUrl: 'https://image.tmdb.org/t/p/',
        secureBaseUrl: 'https://image.tmdb.org/t/p/',
        backdropSizes: ['w300', 'w780', 'w1280'],
        logoSizes: ['w45', 'w92'],
        posterSizes: ['w92', 'w154', 'w185', 'w342', 'w500', 'w780'],
        profileSizes: ['w45', 'w185'],
        stillSizes: ['w92', 'w300'],
      );
      final config = MovieConfiguration(images: images, changeKeys: []);

      final small = getSizedImageUrl(ImageSize.small, config, '/poster.jpg');
      expect(small, 'https://image.tmdb.org/t/p/w154/poster.jpg');

      final large = getSizedImageUrl(ImageSize.large, config, '/poster.jpg');
      expect(large, 'https://image.tmdb.org/t/p/w780/poster.jpg');
    });

    test('Sorting enum has readable names', () {
      expect(Sorting.aToz.name, 'A-Z');
      expect(Sorting.rating.name, 'Rating');
    });
  });
}
