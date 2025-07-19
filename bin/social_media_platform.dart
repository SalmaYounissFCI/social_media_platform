import 'dart:io';
import 'dart:async';
import 'content.dart';
import 'interfaces.dart';
import 'mixins.dart';

void main() async {
  String? continueChoice;

  do {
    print("Choose post type: 1. Text  2. Image  3. Video");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("Enter text content:");
        String? text = stdin.readLineSync();
        print("Enter number of likes:");
        int likes = int.parse(stdin.readLineSync()!);
        print("Enter number of comments:");
        int comments = int.parse(stdin.readLineSync()!);

        var textPost = TextPost(text!, comments, likes);
        await simulateContentCreation(textPost);
        break;

      case '2':
        print("Enter image URL:");
        String? url = stdin.readLineSync();
        print("Enter number of likes:");
        int likes = int.parse(stdin.readLineSync()!);
        print("Enter number of shares:");
        int shares = int.parse(stdin.readLineSync()!);

        var imagePost = ImagePost(url!, likes, shares);
        await simulateContentCreation(imagePost);
        break;

      case '3':
        print("Enter video duration in minutes:");
        double duration = double.parse(stdin.readLineSync()!);
        print("Enter video URL:");
        String? url = stdin.readLineSync();
        print("Enter number of views:");
        int views = int.parse(stdin.readLineSync()!);
        print("Enter number of likes:");
        int likes = int.parse(stdin.readLineSync()!);

        var videoPost = VideoPost(duration, url!, views, likes);
        await simulateContentCreation(videoPost);
        break;

      default:
        print("Invalid option.");
    }

    print("Would you like to create another post? (y/n)");
    continueChoice = stdin.readLineSync();
  } while (continueChoice?.toLowerCase() == 'y');

  print("Thanks for using the Content Simulator ");
}
