enum AppMessageColors { success, error, info }

class AppMessage {
  AppMessage({
    required this.text,
    required this.type,
    this.duration = const Duration(milliseconds: 2000),
  });

  final Duration duration;
  final String text;
  final AppMessageColors type;
}
