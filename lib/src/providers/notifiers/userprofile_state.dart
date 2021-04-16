import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/models.dart';

class UserProfileProvider extends StateNotifier<Profile> {
  UserProfileProvider([Profile profile]) : super(profile);

  void addProfile({@required String fn, @required String ln}) {
    print({'fName': fn, 'lName': ln});
    state = Profile(firstName: fn, lastName: ln);
  }
}

final userprofileProvider =
    StateNotifierProvider<UserProfileProvider,Profile>((ref) => UserProfileProvider());
