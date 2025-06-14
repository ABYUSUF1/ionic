import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/utils/enums/delivery_instructions_enum.dart';
import 'package:ionic/features/checkout/presentation/widgets/checkout_custom_box.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../manager/cubit/checkout_cubit.dart';

class CheckoutDeliveryInstructions extends StatelessWidget {
  const CheckoutDeliveryInstructions({super.key});

  List<Map<String, dynamic>> instructions(BuildContext context) => [
    {
      "title": context.tr(LocaleKeys.checkout_leave_at_door),
      "icon": Icons.door_front_door_outlined,
      "type": DeliveryInstructionsEnum.leaveAtDoor,
    },
    {
      "title": context.tr(LocaleKeys.checkout_hand_it_to_me),
      "icon": Icons.person_outline,
      "type": DeliveryInstructionsEnum.handItToMe,
    },
    {
      "title": context.tr(LocaleKeys.checkout_call_on_arrival),
      "icon": Icons.call_outlined,
      "type": DeliveryInstructionsEnum.callOnArrival,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedInstruction =
        context.watch<CheckoutCubit>().state.deliveryInstruction;

    return CheckoutCustomBox(
      title: context.tr(LocaleKeys.checkout_delivery_instructions),
      child: SizedBox(
        height: 80,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: instructions(context).length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final item = instructions(context)[index];
            final type = item['type'] as DeliveryInstructionsEnum;
            final isSelected = selectedInstruction == type;

            return GestureDetector(
              onTap: () {
                context.read<CheckoutCubit>().setDeliveryInstruction(type);
              },
              child: Container(
                width: 200,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? AppColors.primaryColor.withValues(alpha: .2)
                          : theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:
                        isSelected
                            ? AppColors.primaryColor
                            : theme.colorScheme.outline,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(item['icon'], color: theme.colorScheme.onSurface),
                    const SizedBox(width: 10),
                    Expanded(child: Text(item['title'])),
                    Checkbox(
                      value: isSelected,
                      onChanged: (_) {
                        context.read<CheckoutCubit>().setDeliveryInstruction(
                          type,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
