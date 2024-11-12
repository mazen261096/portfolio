import '../../domain/entities/personal_info.dart';

class PersonalInfoModel extends PersonalInfo {
  PersonalInfoModel({
    required super.name,
    required super.profession,
    required super.profileImage,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return PersonalInfoModel(
      name: json['name'],
      profession: json['profession'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profession': profession,
      'profileImageUrl': profileImage,
    };
  }

  // تحويل من كائن Entity إلى Model
  static PersonalInfoModel fromEntity(PersonalInfo entity) {
    return PersonalInfoModel(
      name: entity.name,
      profession: entity.profession,
      profileImage: entity.profileImage,
    );
  }
}
