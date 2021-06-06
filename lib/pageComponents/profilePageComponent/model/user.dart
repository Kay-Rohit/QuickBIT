
class LocalUser {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const LocalUser({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });
}