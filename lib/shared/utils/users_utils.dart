import 'dart:ui';

import 'package:cms_pocs/login/data/models/user.dart';

import 'constants.dart';

class UsersUtils {
  List<User> getUsers() {
    return [
      User(
          firstName: "Brian",
          lastName: "Smith",
          email: "brian.smith@example.com",
          phoneNumber: "(941)444-4444",
          country: "US"),
      User(
          firstName: "Maria",
          lastName: "Hernandez",
          email: "taria.hernandez@example.com",
          phoneNumber: "(614)888-8888",
          country: "MX"),
      User(
          firstName: "Tina",
          lastName: "Tremblay",
          email: "tina.tremblay@example.com",
          phoneNumber: "(785)666-6666",
          country: "CA"),
    ];
  }

  Future<String> getCountryCode(String country) async {
    //probably better tyo use a webservice to get the country code based on the
    // country string that way if the cms id changes the change can be done outside
    // of the app

    // simulating Api call delay
    await Future.delayed(const Duration(seconds: 1));
    switch (country) {
      case mexicoLocale:
        return mexicoId;
      case usaLocale:
        return usaId;
      case canadaLocale:
        return canadaId;
      default:
        return usaId;
    }
  }
}
