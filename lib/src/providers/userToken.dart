import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:shared_preferences/shared_preferences.dart';

final userToken = Provider((ref) => SharedPreferences.getInstance()
    .then((value) => value.getString('user_token')));
final userRefreshToken = Provider((ref) => SharedPreferences.getInstance()
    .then((value) => value.getString('refresh_token')));
