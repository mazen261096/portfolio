


import '../../../core/utils/enums.dart';
import '../../domain/entities/user.dart';

class AppUserModel extends AppUser {
  const AppUserModel({
    required super.id,
    required super.userName,
    required super.email,
  });

  factory AppUserModel.fromJson(Map<String, dynamic> json) {
    return AppUserModel(
      id: json['id'],
      userName: json['user_name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'email': email,
    };
  }

}
