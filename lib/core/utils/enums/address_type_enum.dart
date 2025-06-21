import 'package:easy_localization/easy_localization.dart';

import '../../../generated/locale_keys.g.dart';

enum AddressTypeEnum { home, work, other }

extension AddressTypeEnumLabel on AddressTypeEnum {
  String get label {
    switch (this) {
      case AddressTypeEnum.home:
        return LocaleKeys.address_type_home.tr();
      case AddressTypeEnum.work:
        return LocaleKeys.address_type_work.tr();
      case AddressTypeEnum.other:
        return LocaleKeys.address_type_other.tr();
    }
  }
}
