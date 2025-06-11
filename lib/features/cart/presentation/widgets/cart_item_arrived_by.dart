import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/constants/app_font.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class CartItemArrivedBy extends StatelessWidget {
  final int deliveryDays;
  const CartItemArrivedBy({super.key, required this.deliveryDays});

  @override
  Widget build(BuildContext context) {
    // Get locale
    final locale = context.locale.languageCode;

    // Get day and month name
    final day = DateTime.now().add(Duration(days: deliveryDays)).day.toString();
    final monthName = DateFormat.MMM(locale).format(DateTime.now());

    return Row(
      spacing: 4,
      children: [
        Text(
          context.tr(LocaleKeys.delivery_arrives_by),
          style: TextStyle(fontFamily: appFont(context)),
        ),
        Text(
          deliveryDays == 1
              ? context.tr(LocaleKeys.common_tomorrow)
              : "$day $monthName",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontFamily: appFont(context),
          ),
        ),
      ],
    );
  }
}
