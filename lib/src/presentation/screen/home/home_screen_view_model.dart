import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:movie/src/core/lifecycle/use_lifecycle.dart';
import 'package:flutter/material.dart';

import '../../../data/repository/home_page_repo.dart';
import '../../../model/movie.dart';

class HomeScreenViewModel extends UseLifeCycle with ChangeNotifier {
  TextEditingController title = TextEditingController();

  HomeScreenViewModel() {
    Future.delayed(const Duration(microseconds: 100), () async {
      fetchMovies();
      // Do something
    });
  }

  final ValueNotifier<List<MovieResult>> _movies = ValueNotifier([]);

  ValueNotifier<List<MovieResult>> get movies => _movies;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    try {
      _isLoading.value = true;
      notifyListeners();

      // Replace this with your actual API call
      final moviesData = await MovieRepo().fetchMoviesData();

      _movies.value = moviesData!.results;
      notifyListeners();
    } catch (e) {
      print("Error fetching movies: $e");
    } finally {
      _isLoading.value = false;
      notifyListeners();
    }
  }

  void filterMovies(String query) {
    if (query.isEmpty) {
      // Fetch all movies again
      fetchMovies();
    } else {
      _movies.value = _movies.value
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      notifyListeners();
    }
  }
}
