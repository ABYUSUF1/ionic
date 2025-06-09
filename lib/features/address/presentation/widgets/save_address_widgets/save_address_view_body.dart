import 'package:flutter/widgets.dart';

import 'address_additional_info.dart';
import 'address_details.dart';
import 'address_personal_info.dart';
import 'is_default_checkbox.dart';

class SaveAddressViewBody extends StatelessWidget {
  const SaveAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        spacing: 30,
        children: [
          AddressDetails(),
          AddressPersonalInformation(),
          AddressAdditionalInformation(),
          IsDefaultCheckbox(),
        ],
      ),
    );
  }
}
