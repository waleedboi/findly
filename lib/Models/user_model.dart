import 'package:findly/Constant/enum.dart';

class UserModel {
  String? firstName;
  String? lastName;
  String? userName;
  String? fullNaame;
  String? email;
  String? password;
  String? image;
  UserType? userType;
  String? campus;
  String? role;

  UserModel(
      {this.firstName,
      this.lastName,
      this.fullNaame,
      this.userName,
      this.email,
      this.password,
      this.image,
      this.userType,
      this.role,
      this.campus});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullNaame = json['fullNaame'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    userType =
        UserType.values.firstWhere((e) => e.toString() == json['userType']);
    role = json['role'];
    campus = json['campus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullNaame'] = fullNaame;
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['userType'] = userType.toString();
    data['role'] = role;
    data['campus'] = campus;
    return data;
  }
}
