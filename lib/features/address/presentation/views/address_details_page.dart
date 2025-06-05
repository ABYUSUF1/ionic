import 'package:flutter/material.dart';
import 'package:ionic/features/address/presentation/widgets/address_details_widgets/address_aditional_info.dart';

import '../../../../core/widgets/buttons/custom_filled_button.dart';
import '../widgets/address_details_widgets/address_details.dart';
import '../widgets/address_details_widgets/address_personal_info.dart';

class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Save Address")),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomFilledButton(text: "Save Address", onPressed: () {}),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 30,
          children: [
            AddressDetails(),
            AddressPersonalInformation(),
            AddressAdditionalInformation(),
          ],
        ),
      ),
    );
  }
}
