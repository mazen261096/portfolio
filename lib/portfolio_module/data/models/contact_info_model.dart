import '../../domain/entities/contact_info.dart';

class ContactInfoModel extends ContactInfo {
  ContactInfoModel({
    required super.id,
    required super.name,
    required super.logoUrl,
    required super.linkOrPhone,
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logoUrl'],
      linkOrPhone: json['linkOrPhone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'linkOrPhone': linkOrPhone,
    };
  }

  static ContactInfoModel fromEntity(ContactInfo entity) {
    return ContactInfoModel(
      id: entity.id,
      name: entity.name,
      logoUrl: entity.logoUrl,
      linkOrPhone: entity.linkOrPhone,
    );
  }
}
