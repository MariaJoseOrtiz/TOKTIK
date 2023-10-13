import 'package:flutter/material.dart';
import 'package:toktik/shared/data/local_video_post.dart';

import '../../../domain/entities/video_post.dart';
import '../video/fullscreen_playe.dart';
import 'video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPosts = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child:FullScreenPlayer(
                caption: videoPosts.caption,
                videoUrl: videoPosts.videoUrl,
              ),
            ),
            //FullScreenPlayer(video: videoPost),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPosts),
            )
          ],
        );
      },
    );
  }
}
