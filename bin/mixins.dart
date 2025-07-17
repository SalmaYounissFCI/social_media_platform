mixin ApiConnector {
  void fetchData() {
    print("Fetching Data ");
  }

  void sendData() {
    print("Sending Data");
  }
}
mixin NotificationService {
  void sendPushNotification() {
    print("Push Notification sent");
  }

  void sendEmail() {
    print("Email sent");
  }

  void sendSMS() {
    print("SMS sent");
  }
}
mixin AnalyticsTracker {
  void trackEvent(String eventName) {
    print("Tracked Event: $eventName");
  }
}
