// ignore_for_file: public_member_api_docs, sort_constructors_first
class SigninModel {
  String email;
  String password;

  SigninModel({required this.email, required this.password});
}

class SignupModel {
  String fName;
  String lName;
  String phoneNumber;
  String email;
  String password;

  SignupModel({
    required this.fName,
    required this.lName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  String get fullName => '$fName $lName';
}
