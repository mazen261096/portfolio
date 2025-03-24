// entities/personal_info.dart
class PersonalInfo {
  final String name;
  final String profession;
  final String? profileImage;
  final String? description;

  PersonalInfo(
      {required this.name,
      required this.profession,
       this.profileImage,
         this.description
      });
}
