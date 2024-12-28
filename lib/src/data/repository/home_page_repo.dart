import 'dart:convert';

import 'package:movie/src/api_client/base_client.dart';
import 'package:movie/src/model/movie.dart';

import '../../api_client/urls.dart';

abstract class MovieRepository {
  Future<Movie?> fetchMoviesData();

  Future<String?> fetchTrailerUrl(int movieId);
}

class MovieRepo extends MovieRepository {
  @override
  Future<Movie?> fetchMoviesData() async {
    try {
      // Fetch the raw response as a String
      final response = await BaseClient().get(ApiUrl.moviesUrl);

      if (response != null && response.isNotEmpty) {
        // Decode the JSON string into a Map
        final jsonResponse = jsonDecode(response) as Map<String, dynamic>;

        // Parse the Map into the Movie model
        return Movie.fromJson(jsonResponse);
      } else {
        throw Exception("Empty response from server");
      }
    } catch (e) {
      // Log and handle any errors
      print("Error fetching movies data: $e");
      return null;
    }
  }

  @override
  Future<String?> fetchTrailerUrl(int movieId) async {
    try {
      final response = await BaseClient().get(
        '${ApiUrl.baseUrl}$movieId/videos',
      );
      final jsonResponse = jsonDecode(response) as Map<String, dynamic>;
      final results = jsonResponse['results'] as List<dynamic>;

      // Attempt to find a "Trailer" first
      final trailer = results.firstWhere(
        (video) => video['type'] == 'Trailer' && video['site'] == 'YouTube',
        orElse: () => null,
      );

      // If no "Trailer" is found, try "Featurette" or any available video
      final fallbackVideo = trailer ??
          results.firstWhere(
            (video) =>
                video['type'] == 'Featurette' && video['site'] == 'YouTube',
            orElse: () => null,
          );

      if (fallbackVideo != null) {
        return 'https://www.youtube.com/watch?v=${fallbackVideo['key']}';
      }
      return null; // No suitable video found
    } catch (e) {
      print("Error fetching trailer URL: $e");
      return null;
    }
  }
}
