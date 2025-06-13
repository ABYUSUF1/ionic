import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import 'checkout_custom_box.dart';

class CheckoutDeliveryInstructions extends StatefulWidget {
  const CheckoutDeliveryInstructions({super.key});

  @override
  State<CheckoutDeliveryInstructions> createState() =>
      _CheckoutDeliveryInstructionsState();
}

class _CheckoutDeliveryInstructionsState
    extends State<CheckoutDeliveryInstructions> {
  int? selectedIndex;

  List<Map<String, dynamic>> instructions(BuildContext context) => [
    {
      "title": context.tr(LocaleKeys.checkout_leave_at_door),
      "icon": Icons.door_front_door_outlined,
    },
    {
      "title": context.tr(LocaleKeys.checkout_hand_it_to_me),
      "icon": Icons.person_outline,
    },
    {
      "title": context.tr(LocaleKeys.call_on_arrival),
      "icon": Icons.call_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CheckoutCustomBox(
      title: context.tr(LocaleKeys.checkout_delivery_instructions),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: instructions(context).length,
          itemBuilder: (context, index) {
            final item = instructions(context)[index];
            final isSelected = selectedIndex == index;

            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
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
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
