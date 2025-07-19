import 'interfaces.dart';
import 'mixins.dart';

abstract class Content {
  int? likes;
  int? comments;
  Content(this.likes, this.comments);

  String getContentType();
  Map<String, dynamic> toJson();
  double getEngagmentScore();

  void share() {}
}

class TextPost extends Content
    with ApiConnector, NotificationService, AnalyticsTracker
    implements Shareable, Moderatable {
  String? txt;

  TextPost(this.txt, int comments, int likes) : super(likes, comments);

  @override
  String getContentType() {
    return 'Text';
  }

  @override
  double getEngagmentScore() {
    return (likes ?? 0) * 0.7 + (comments ?? 0) * 0.3;
  }

  @override
  Map<String, dynamic> toJson() {
    return {"type": "Text", "text": txt, "likes": likes, "comments": comments};
  }

  @override
  void share() {
    print("Sharing text post: $txt");
  }

  @override
  bool moderate() {
    return txt!.length <= 200;
  }
}

class ImagePost extends Content
    with ApiConnector, NotificationService, AnalyticsTracker
    implements Shareable {
  String? imgURL;
  ImagePost(this.imgURL, int likes, int comments) : super(likes, comments);

  @override
  String getContentType() {
    return "Image";
  }

  @override
  double getEngagmentScore() {
    return (likes ?? 0) * 0.6 + (comments ?? 0) * 0.4;
  }

  @override
  Map<String, dynamic> toJson() {
    return {"type": "Image", "Url": imgURL, "likes": likes};
  }

  @override
  void share() {
    print("Sharing image :$imgURL");
  }
}

class VideoPost extends Content
    with ApiConnector, AnalyticsTracker, NotificationService
    implements Shareable {
  String? videoUrl;
  double? duration;
  VideoPost(this.duration, this.videoUrl, int likes, int comments)
    : super(likes, comments);

  @override
  String getContentType() {
    return "Video";
  }

  @override
  double getEngagmentScore() {
    return (likes ?? 0) * 0.5 + (comments ?? 0) * 0.3 + (duration ?? 0) * 0.2;
  }

  @override
  Map<String, dynamic> toJson() {
    return {"type": "Video", "title": "Cool Video", "Views": likes};
  }

  @override
  void share() {
    print("Sharing video: $videoUrl");
  }
}

Future<void> simulateContentCreation(Content content) async {
  print("\nCreating ${content.getContentType()} post...");
  await Future.delayed(Duration(seconds: 1));
  print("Post details: ${content.toJson()}");

  print("Content shared!");
  print("Analytics Event: Post shared");
  print("Content cached!");
  if (content is Shareable) {
    (content as Shareable).share();
  }
  if (content is ApiConnector) {
    (content as ApiConnector).fetchData();
    (content as ApiConnector).sendData();
  }
  if (content is NotificationService) {
    (content as NotificationService).sendPushNotification();
  }

  if (content is TextPost || content is VideoPost) {
    print("Content passed moderation");
    print("Push Notification sent!");
  }

  if (content is VideoPost) {
    print("Content is being streamed...");
  }

  print("Engagement score: ${content.getEngagmentScore()}\n");
}
