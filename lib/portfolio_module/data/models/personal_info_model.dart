import '../../domain/entities/personal_info.dart';

class PersonalInfoModel extends PersonalInfo {
  PersonalInfoModel({
    required super.name,
    required super.profession,
    super.profileImage,
    super.description,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return PersonalInfoModel(
      name: json['name'],
      profession: json['profession'],
      profileImage: json['profileImage'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profession': profession,
      'profileImageUrl': profileImage,
      'description': description,
    };
  }

  // تحويل من كائن Entity إلى Model

}
