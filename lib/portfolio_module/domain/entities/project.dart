
// entities/project.dart
class Project {
  final String id;
  final String name;
  final String description;
  final List<String> technologies;
  final List<String> links;
  final List<String> images;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.technologies,
    required this.links,
    required this.images,
  });

}
