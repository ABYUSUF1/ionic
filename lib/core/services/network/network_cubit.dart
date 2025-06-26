import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { connected, disconnected }

class NetworkCubit extends Cubit<NetworkStatus> {
  final Connectivity connectivity;

  bool wasDisconnected = false;

  NetworkCubit(this.connectivity) : super(NetworkStatus.connected) {
    _checkInitialNetwork();

    connectivity.onConnectivityChanged.listen((status) {
      if (status.contains(ConnectivityResult.none)) {
        wasDisconnected = true;
        emit(NetworkStatus.disconnected);
      } else {
        emit(NetworkStatus.connected);
      }
    });
  }

  Future<void> _checkInitialNetwork() async {
    final status = await connectivity.checkConnectivity();
    if (status.contains(ConnectivityResult.none)) {
      wasDisconnected = true;
      emit(NetworkStatus.disconnected);
    } else {
      emit(NetworkStatus.connected);
    }
  }

  void markReconnectionHandled() {
    wasDisconnected = false;
  }
}
