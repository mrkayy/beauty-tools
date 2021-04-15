import '../models/models.dart';

class CommonListOptions {
  static List<CommonList> myInfo(String description) {
    final list = [
      CommonList('First Name: ', description),
      CommonList('Last Name: ', description),
      CommonList('Email: ', description),
      CommonList('DOB: ', description),
      CommonList('Contact: ', description),
    ];

    return list;
  }
  static List<CommonList> myAddress(String description) {
    final list = [
      CommonList('Address 1: ', description),
      CommonList('Address 2: ', description),
    ];

    return list;
  }
}
