class AppEnvironment {
  AppEnvironment({required this.baseUrl});

  factory AppEnvironment.dev() {
    return AppEnvironment(baseUrl: 'https://helper_dev.ourgold.ru/api/mobile');
  }

  final String baseUrl;
}
