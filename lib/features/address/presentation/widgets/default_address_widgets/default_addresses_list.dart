import 'package:animate_do/animate_do.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';
import '../../../domain/entity/address_entity.dart';
import 'address_set_as_default_button.dart';
import 'address_upper.dart';
import 'address_user_info.dart';

import 'package:flutter/material.dart';

class DefaultAddressesList extends StatelessWidget {
  const DefaultAddressesList({
    super.key,
    required this.isLoading,
    required this.addresses,
  });

  final bool isLoading;
  final List<AddressEntity> addresses;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SkeletonLoading(
      isLoading: isLoading,
      child: FadeInDown(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 300),
        from: 30,
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: isLoading ? 3 : addresses.length,
          itemBuilder: (BuildContext context, int index) {
            final address = isLoading ? addresses[0] : addresses[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border:
                    address.isDefault
                        ? Border.all(color: AppColors.primaryColor, width: 2)
                        : null,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  AddressUpper(addressEntity: address),
                  const Divider(),
                  AddressUserInfo(addressEntity: address),
                  const Divider(),
                  AddressSetAsDefaultButton(addressEntity: address),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
