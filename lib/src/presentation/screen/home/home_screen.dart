import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/src/api_client/urls.dart';
import 'package:movie/src/config/theme/local/app_text_style.dart';
import 'package:movie/src/core/builders/consumer/consumer_on_ready_callback.dart';
import 'package:movie/src/core/utils/app_custom_color.dart';
import 'package:movie/src/presentation/widgets/generics/generic_text/generic_text.dart';

import 'package:provider/provider.dart';

import 'package:movie/src/presentation/screen/home/home_screen_view_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/params/app_ui/app_ui_params.dart';

import '../../../injector.dart';
import '../../../model/movie.dart';
import '../../widgets/base/base_widget.dart';
import 'home_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';
  final AppUIParams appUIParams;

  const HomeScreen({super.key, required this.appUIParams});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewModel>(
      builder: (context, viewModel, _) {
        return BaseWidget(
          resizeToAvoidBottomPadding: false,
          useBaseWidgetPadding: true,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 8,right: 8),
                  child: TextField(
                    controller: viewModel.title,
                    onChanged: (query) => viewModel.filterMovies(query),
                    decoration: InputDecoration(
                      hintText: 'TV shows, movies and more',
                      hintStyle: injector<AppTextStyles>().regular12.copyWith(
                        color: Colors.grey, // Adjust hint text color
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black, // Adjust search icon color
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black, // Adjust cross icon color
                        ),
                        onPressed: () {
                          // Clear the text field's content
                          viewModel.title.clear();
                          viewModel.filterMovies('');
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30), // Circular border
                        borderSide:  BorderSide(color:injector<AppCustomColor>().light), // Light grey border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:  BorderSide(color: injector<AppCustomColor>().light),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:  BorderSide(color: injector<AppCustomColor>().light),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200], // Light grey fill color
                      contentPadding: const EdgeInsets.symmetric(vertical: 10), // Adjust padding
                    ),
                  ),
                ),
                SizedBox(height: 20.sp,),
                Expanded(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: viewModel.isLoading,
                    builder: (context, isLoading, _) {
                      if (isLoading) {
                        return buildShimmerGrid();
                      } else {
                        return ValueListenableBuilder<List<MovieResult>>(
                          valueListenable: viewModel.movies,
                          builder: (context, movies, _) {
                            if (movies.isEmpty) {
                              return const Center(child: Text('No movies found'));
                            }
                            return buildMovieGrid(movies);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 16,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildMovieGrid(List<MovieResult> movies) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailScreen(movie: movie),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      ApiUrl.baseImageUrl+movie.backdropPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GenericText(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: injector<AppTextStyles>().bold12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}






