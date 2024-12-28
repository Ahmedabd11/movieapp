import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/src/config/theme/local/app_text_style.dart';
import 'package:movie/src/injector.dart';
import 'package:movie/src/presentation/widgets/generics/generic_text/generic_text.dart';

import '../../../api_client/urls.dart';
import '../../../core/utils/app_custom_color.dart';
import '../../../data/repository/home_page_repo.dart';
import '../../../model/movie.dart';
import 'full_screen_video.dart';
class HomeDetailScreen extends StatelessWidget {
  final MovieResult movie;

  const HomeDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  GenericText(movie.title, style: injector<AppTextStyles>().medium18),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: injector<AppCustomColor>().buttonTextColor),
          onPressed: () {
            Navigator.of(context).pop(); // Close the player when "Done" is pressed
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  ApiUrl.baseImageUrl + movie.backdropPath,
                  width: double.infinity,
                  height: 370.sp,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 80,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add your action for "Get Tickets" here
                          print("Get Tickets button clicked");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue, // Background color
                          padding: const EdgeInsets.symmetric(horizontal: 54.0, vertical: 12.0),
                        ),
                        child:  GenericText(
                          "Get Tickets",
                          style: injector<AppTextStyles>().regular16.copyWith(color: Colors.white)
                        ),
                      ),
                      // Watch Trailer Button
                      SizedBox(height: 10,),
                      OutlinedButton(
                        onPressed: () async {
                          _playTrailer(context, movie.id);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                        ),
                        child:  Text(
                          "Watch Trailer",
                          style: injector<AppTextStyles>().regular16.copyWith(color: Colors.white)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                      style: injector<AppTextStyles>().bold22
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Genres: ${movie.genreIds.join(", ")}',
                    style: injector<AppTextStyles>().medium18
                  ),
                  const SizedBox(height: 10),
                   Text(
                    "Overview",
                    style:  injector<AppTextStyles>().bold20
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movie.overview,
                    style: injector<AppTextStyles>().regular16
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _playTrailer(BuildContext context, int movieId) async {
    final trailerUrl = await MovieRepo().fetchTrailerUrl(movieId);
    if (trailerUrl != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullScreenVideoPlayer(url: trailerUrl),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Trailer not available')),
      );
    }
  }
}