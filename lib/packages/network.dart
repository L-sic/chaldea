import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class _NetworkStat {
  ConnectivityResult? _connectivity;

  bool get available =>
      _connectivity != null && _connectivity != ConnectivityResult.none;

  bool get unavailable => !available;

  StreamSubscription<ConnectivityResult>? _subscription;

  Future<void> init() async {
    await check();
    _subscription?.cancel();
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      _connectivity = result;
    });
  }

  void dispose() {
    _subscription?.cancel();
  }

  Future<ConnectivityResult> check() async {
    return _connectivity = await Connectivity().checkConnectivity();
  }
}

final network = _NetworkStat();

bool get hasNetwork => network.available;
