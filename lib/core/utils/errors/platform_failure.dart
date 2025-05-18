import 'package:flutter/services.dart';

import 'failure.dart';

class PlatformFailure extends Failure {
  PlatformFailure(super.errMessage);

  factory PlatformFailure.fromCode(PlatformException e) {
    switch (e.code) {
      case 'network_error':
        return PlatformFailure('Please check your internet connection');
      default:
        return PlatformFailure('Something went wrong');
    }
  }
}
