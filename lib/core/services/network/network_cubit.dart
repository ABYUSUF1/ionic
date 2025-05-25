import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkCubit extends Cubit<bool> {
  late final StreamSubscription<InternetStatus> _subscription;

  NetworkCubit() : super(true) {
    _subscription = InternetConnection().onStatusChange.listen((status) {
      emit(status == InternetStatus.connected);
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
