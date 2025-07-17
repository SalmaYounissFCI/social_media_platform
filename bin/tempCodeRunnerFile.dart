Future<void> simulateContentCreation(Content content) async {
  try {
    print("Creating content...");
    await Future.delayed(Duration(seconds: 2));
    print("Created: ${content.toJson()}");
  } catch (e) {
    print("Error: $e");
  }
}