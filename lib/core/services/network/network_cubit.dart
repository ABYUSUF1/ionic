import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { connected, disconnected }

class NetworkCubit extends Cubit<NetworkStatus> {
  final Connectivity connectivity;

  NetworkCubit(this.connectivity) : super(NetworkStatus.disconnected) {
    // Immediately check network status
    _checkInitialNetwork();

    // Listen to real-time changes
    connectivity.onConnectivityChanged.listen((status) {
      if (status.contains(ConnectivityResult.none)) {
        emit(NetworkStatus.disconnected);
      } else {
        emit(NetworkStatus.connected);
      }
    });
  }

  Future<void> _checkInitialNetwork() async {
    final status = await connectivity.checkConnectivity();
    if (status.contains(ConnectivityResult.none)) {
      emit(NetworkStatus.disconnected);
    } else {
      emit(NetworkStatus.connected);
    }
  }
}
