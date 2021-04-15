import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingNotifier extends ChangeNotifier {
  LoadingNotifier([this._loading = false]);

  bool _loading;
  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }
}

//loading Change notifier
final loadingChangeNotifer = ChangeNotifierProvider((ref) => LoadingNotifier());
