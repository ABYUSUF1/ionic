import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../manager/save_address/save_address_cubit.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.surface,
      ),
      child: TextField(
        maxLines: 5,
        minLines: 1,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        controller: context.read<SaveAddressCubit>().addressController,
        decoration: InputDecoration(
          label: Text(context.tr(LocaleKeys.address_address)),
          hintStyle: theme.textTheme.headlineMedium!.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}


// Row(
//         spacing: 16,
//         children: [
//           Expanded(child: Text(address, style: theme.textTheme.headlineMedium)),
//           ElevatedButton.icon(
//             onPressed: () {
//               /// TODO: Edit address
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primaryColor.withValues(alpha: .2),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               foregroundColor: AppColors.primaryColor,
//             ),
//             icon: const Icon(Icons.edit),
//             label: Text(
//               context.tr(LocaleKeys.common_edit),
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),