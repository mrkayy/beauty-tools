import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/services.dart';
import './app_providers.dart';

final userAccount = Provider((ref) => AccountServices());
