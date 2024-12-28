import 'package:flutter/material.dart';
import 'package:movie/src/config/theme/local/app_text_style.dart';
import 'package:movie/src/core/utils/app_custom_color.dart';
import 'package:movie/src/injector.dart';
import 'package:movie/src/presentation/widgets/generics/generic_text/generic_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final String url;

  const FullScreenVideoPlayer({Key? key, required this.url}) : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.url);
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    _youtubeController.addListener(() {
      if (_youtubeController.value.playerState == PlayerState.ended) {
        Navigator.of(context).pop(); // Close the player when the video ends
      }
    });
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  GenericText("Trailer", style: injector<AppTextStyles>().medium18),
        leading: IconButton(
          icon:  Icon(Icons.close, color:  injector<AppCustomColor>().buttonTextColor),
          onPressed: () {
            Navigator.of(context).pop(); // Close the player when "Done" is pressed
          },
        ),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}