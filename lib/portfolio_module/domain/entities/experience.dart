
// entities/experience.dart
class Experience {
  final String id;
  final String companyName;
  final String logoUrl;
  final String role;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  Experience({
    required this.id,
    required this.companyName,
    required this.logoUrl,
    required this.role,
    required this.description,
    required this.startDate,
    required this.endDate,
  });
}
