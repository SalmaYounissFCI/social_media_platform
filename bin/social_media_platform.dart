import 'content.dart';
import 'interfaces.dart';
import 'mixins.dart';
import 'dart:async';

void main() async {
  print("\n");
  // Text Post
  var textPost = TextPost("Learning Dart is fun!", 30, 120);
  await simulateContentCreation(textPost);

  // Image Post
  var imagePost = ImagePost("https://example.com/image.jpg", 80, 20);
  await simulateContentCreation(imagePost);

  // Video Post
  var videoPost = VideoPost(3.5, "https://example.com/video.mp4", 150, 60);
  await simulateContentCreation(videoPost);
}
