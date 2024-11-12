import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  ProjectModel({
    required super.id,
    required super.name,
    required super.description,
    required super.technologies,
    required super.links,
    required super.images,
  });

  // Factory method to create ProjectModel from JSON
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      technologies: List<String>.from(json['technologies'] ?? []),
      links: List<String>.from(json['links'] ?? []),
      images: List<String>.from(json['images'] ?? []),
    );
  }

  // Method to convert ProjectModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'technologies': technologies,
      'links': links,
      'images': images,
    };
  }

  // Static method to convert from an Entity to a ProjectModel
  static ProjectModel fromEntity(Project entity) {
    return ProjectModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      technologies: entity.technologies,
      links: entity.links,
      images: entity.images,
    );
  }
}
