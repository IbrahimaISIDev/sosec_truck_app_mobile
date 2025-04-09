class Task {
  final String title;
  final String subtitle;
  final bool isCompleted;
  final String iconPath; // Pour simuler une icône (on utilisera des icônes Material)

  Task({
    required this.title,
    required this.subtitle,
    required this.isCompleted,
    required this.iconPath,
  });
}