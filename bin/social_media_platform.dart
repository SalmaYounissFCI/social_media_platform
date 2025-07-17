import 'content.dart';
import 'interfaces.dart';
import 'mixins.dart';
import 'dart:async';


void displayTextPostDetails(TextPost textPost) {
  print("\n=== Text Post Details ===");
  print("Type: ${textPost.getContentType()}");
  print("Engagement Score: ${textPost.getEngagmentScore()}");

  textPost.share();
  textPost.fetchData();
  textPost.sendData();
  textPost.sendPushNotification();
  textPost.sendEmail();
  textPost.sendSMS();
  textPost.trackEvent("Text post interaction");
}

void displayImagePostDetails(ImagePost imagePost) {
  print("\n=== Image Post Details ===");
  print("Type: ${imagePost.getContentType()}");
  print("Engagement Score: ${imagePost.getEngagmentScore()}");

  imagePost.share();
  imagePost.fetchData();
  imagePost.sendData();
  imagePost.sendPushNotification();
  imagePost.sendEmail();
  imagePost.sendSMS();
  imagePost.trackEvent("Image post interaction");
}

void displayVideoPostDetails(VideoPost videoPost) {
  print("\n=== Video Post Details ===");
  print("Type: ${videoPost.getContentType()}");
  print("Engagement Score: ${videoPost.getEngagmentScore()}");

  videoPost.share();
  videoPost.fetchData();
  videoPost.sendData();
  videoPost.sendPushNotification();
  videoPost.sendEmail();
  videoPost.sendSMS();
  videoPost.trackEvent("Video post interaction");
}

void main() async {
  print("\n");
  // Text Post
  var textPost = TextPost("Learning Dart is fun!", 30, 120);
  await simulateContentCreation(textPost);
  displayTextPostDetails(textPost);

  if (textPost.moderate()) {
    print("Text post is appropriate.\n");
  } else {
    print("Text post is too long.\n");
  }

  // Image Post
  var imagePost = ImagePost("https://example.com/image.jpg", 80, 20);
  await simulateContentCreation(imagePost);
  displayImagePostDetails(imagePost);

  // Video Post
  var videoPost = VideoPost(3.5, "https://example.com/video.mp4", 150, 60);
  await simulateContentCreation(videoPost);
  displayVideoPostDetails(videoPost);
}
