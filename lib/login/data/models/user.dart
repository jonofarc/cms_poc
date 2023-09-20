import 'package:equatable/equatable.dart';

class User extends Equatable {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String country;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.country,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, phoneNumber, country];

  String getFullName() {
    return "$firstName $lastName";
  }
}
