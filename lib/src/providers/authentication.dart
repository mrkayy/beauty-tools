import "package:flutter_riverpod/flutter_riverpod.dart";
// authentication services class import
import '../services/services.dart';

final authsProvider =
    Provider<AuthenticationServices>((refs) => AuthenticationServices());

// class LoginStateProvider =  