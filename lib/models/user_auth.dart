import 'package:flutter/foundation.dart';
import 'dart:convert';

class AuthenticationModel {
  String email, password;
  AuthenticationModel({@required this.email, @required this.password});
}

class RegistrationModel {
  String email, password, userType;
  RegistrationModel(
      {@required this.email,
      @required this.password,
      this.userType = 'customer'});
}

class SigninAuth {
  SigninAuth({
    this.status,
    this.message,
    this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory SigninAuth.fromMap(Map<String, dynamic> json) => SigninAuth(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  Data({
    this.accessToken,
    this.refreshToken,
    this.profile,
  });

  final String accessToken;
  final String refreshToken;
  final Profile profile;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        profile: Profile.fromMap(json["profile"]),
      );
}

class Profile {
  Profile({
    this.firstName,
    this.lastName,
  });

  final String firstName;
  final String lastName;

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );
}
