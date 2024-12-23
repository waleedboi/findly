class StudentModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? username;
  String? imageUrl;
  String? role;
  String? signUp;
  String? studentCampus; // Optional field
  String? studentNumber; // Optional field

  StudentModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.username,
    this.imageUrl,
    this.role,
    this.signUp,
    this.studentCampus,
    this.studentNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "username": username,
      "imageUrl": imageUrl,
      "role": role,
      "signUp": signUp,
      "studentCampus": studentCampus,
      "studentNumber": studentNumber,
    };

    if (password != null) {
      data["password"] = password;
    }

    if (confirmPassword != null) {
      data["confirmpassword"] = confirmPassword;
    }

    return data;
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmpassword'],
      username: json['username'],
      imageUrl: json['imageUrl'],
      role: json['role'],
      signUp: json['signUp'],
      studentCampus: json['studentCampus'],
      studentNumber: json['studentNumber'],
    );
  }
}

class AgentModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? username;
  String? imageUrl;
  String? role;
  String? signUp;
  String? agentNumber;

  AgentModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.username,
    this.imageUrl,
    this.role,
    this.signUp,
    this.agentNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "username": username,
      "imageUrl": imageUrl,
      "role": role,
      "signUp": signUp,
      "agentNumber": agentNumber,
    };

    if (password != null) {
      data["password"] = password;
    }

    if (confirmPassword != null) {
      data["confirmpassword"] = confirmPassword;
    }

    return data;
  }

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmpassword'],
      username: json['username'],
      imageUrl: json['imageUrl'],
      role: json['role'],
      signUp: json['signUp'],
      agentNumber: json['agentNumber'],
    );
  }
}

class PhotographerModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? username;
  String? imageUrl;
  String? role;
  String? signUp;

  PhotographerModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.username,
    this.imageUrl,
    this.role,
    this.signUp,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "username": username,
      "imageUrl": imageUrl,
      "role": role,
      "signUp": signUp,
    };

    if (password != null) {
      data["password"] = password;
    }

    if (confirmPassword != null) {
      data["confirmpassword"] = confirmPassword;
    }

    return data;
  }

  factory PhotographerModel.fromJson(Map<String, dynamic> json) {
    return PhotographerModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmpassword'],
      username: json['username'],
      imageUrl: json['imageUrl'],
      role: json['role'],
      signUp: json['signUp'],
    );
  }
}
