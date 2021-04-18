import 'package:flutter/foundation.dart';

class Accounts {
  final String fName;
  final String lName;
  final String phone;

  Accounts({@required this.fName, @required this.lName, @required this.phone});
}

class Address {
  final String id;
  final String region;
  final String city;
  final String state;
  final String country;
  final String address;
  final String postalCode;

  Address({
    this.id,
    @required this.city,
    @required this.region,
    @required this.state,
    @required this.country,
    @required this.postalCode,
    @required this.address,
  });
}
