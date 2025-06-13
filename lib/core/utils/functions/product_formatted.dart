import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/models/product_model/dimensions.dart';

import '../../../generated/locale_keys.g.dart';

String formattedPrice(double? price) => price?.toStringAsFixed(2) ?? '0.00';

String formattedDiscountPercentage(double? discountPercentage) =>
    '- ${discountPercentage?.toStringAsFixed(2) ?? '0.00'}%';

String? formattedPriceBeforeDiscount(
  double? price,
  double? discountPercentage,
) {
  if (discountPercentage != null && discountPercentage > 0) {
    final discountedPrice = price! / (1 - discountPercentage / 100);
    return discountedPrice.toStringAsFixed(2);
  }
  return null;
}

String formattedStock(BuildContext context, int? stock) {
  if (stock == null) return context.tr(LocaleKeys.product_not_available);

  if (stock > 0) {
    return stock > 10
        ? context.tr(LocaleKeys.product_in_stock, args: [stock.toString()])
        : context.tr(LocaleKeys.product_only_stock, args: [stock.toString()]);
  } else {
    return context.tr(LocaleKeys.product_out_of_stock);
  }
}

String formattedWarranty(BuildContext context, String? warrantyInformation) {
  final lower = warrantyInformation?.toLowerCase().trim();

  if (lower == 'no warranty') {
    return context.tr(LocaleKeys.product_warranty_none);
  }

  if (lower == 'lifetime warranty') {
    return context.tr(LocaleKeys.product_warranty_lifetime);
  }

  final regex = RegExp(r'(\d+)\s+(month|months|year|years)');
  final match = regex.firstMatch(lower ?? '');

  if (match != null) {
    final number = match.group(1);
    final unit = match.group(2);

    switch (unit) {
      case 'month':
        return number == '1'
            ? context.tr(LocaleKeys.product_warranty_month, args: [number!])
            : context.tr(LocaleKeys.product_warranty_months, args: [number!]);
      case 'months':
        return context.tr(LocaleKeys.product_warranty_months, args: [number!]);
      case 'year':
        return number == '1'
            ? context.tr(LocaleKeys.product_warranty_year, args: [number!])
            : context.tr(LocaleKeys.product_warranty_years, args: [number!]);
      case 'years':
        return context.tr(LocaleKeys.product_warranty_years, args: [number!]);
    }
  }

  // Fallback for unknown or new formats
  return warrantyInformation ?? '';
}

String formattedShipping(BuildContext context, String? shippingInformation) {
  final lower = shippingInformation?.toLowerCase().trim();

  if (lower == 'ships overnight') {
    return context.tr(LocaleKeys.product_shipping_overnight);
  }

  final dayMatch = RegExp(r'ships in (\d+) day\b').firstMatch(lower ?? '');
  final daysMatch = RegExp(r'ships in (\d+) days\b').firstMatch(lower ?? '');
  final businessMatch = RegExp(
    r'ships in (\d+)-(\d+) business days',
  ).firstMatch(lower ?? '');
  final businessSingle = RegExp(
    r'ships in (\d+) business day',
  ).firstMatch(lower ?? '');
  final businessPlural = RegExp(
    r'ships in (\d+) business days',
  ).firstMatch(lower ?? '');
  final weekMatch = RegExp(r'ships in (\d+) week').firstMatch(lower ?? '');
  final weeksMatch = RegExp(r'ships in (\d+) weeks').firstMatch(lower ?? '');
  final monthMatch = RegExp(r'ships in (\d+) month').firstMatch(lower ?? '');
  final monthsMatch = RegExp(r'ships in (\d+) months').firstMatch(lower ?? '');

  if (dayMatch != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_day,
      args: [dayMatch.group(1)!],
    );
  } else if (daysMatch != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_days,
      args: [daysMatch.group(1)!],
    );
  } else if (businessMatch != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_business_days,
      args: [businessMatch.group(1)!, businessMatch.group(2)!],
    );
  } else if (businessSingle != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_business_day,
      args: [businessSingle.group(1)!],
    );
  } else if (businessPlural != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_business_days,
      args: [businessPlural.group(1)!],
    );
  } else if (weekMatch != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_week,
      args: [weekMatch.group(1)!],
    );
  } else if (weeksMatch != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_weeks,
      args: [weeksMatch.group(1)!],
    );
  } else if (monthMatch != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_month,
      args: [monthMatch.group(1)!],
    );
  } else if (monthsMatch != null) {
    return context.tr(
      LocaleKeys.product_shipping_in_months,
      args: [monthsMatch.group(1)!],
    );
  }

  // fallback if nothing matches
  return shippingInformation!;
}

String formattedReturnPolicy(BuildContext context, String? returnPolicy) {
  final lower = returnPolicy?.toLowerCase().trim() ?? '';

  if (lower == 'no return policy') {
    return LocaleKeys.product_return_policy_days.plural(0);
  }

  final match = RegExp(r'(\d+)\s+days?\s+return policy').firstMatch(lower);
  if (match != null) {
    final days = int.parse(match.group(1)!);

    return LocaleKeys.product_return_policy_days.plural(
      days,
      args: [days.toString()],
    );
  }

  return returnPolicy!;
}

String formattedReviewsCount(BuildContext context, int? reviewsCount) {
  return context.plural(
    LocaleKeys.product_reviews_count,
    reviewsCount ?? 0,
    args: [reviewsCount.toString()],
  );
}

String formattedWeight(int? weight) => weight != null ? '$weight g' : 'N/A';

String formattedDimensions(Dimensions? dimensions) =>
    dimensions != null
        ? '${dimensions.depth} x ${dimensions.width} x ${dimensions.height} cm'
        : 'N/A';

bool isFreeDelivery(double price) => price > 200.0 ? true : false;

int deliveryDays(String? shippingInformation) {
  if (shippingInformation == null) return 5;

  final lower = shippingInformation.toLowerCase();

  if (lower.contains('overnight')) return 1;

  final patterns = [
    RegExp(r'ships in (\d+) day\b'),
    RegExp(r'ships in (\d+) days\b'),
    RegExp(r'ships in (\d+)-(\d+) business days'),
    RegExp(r'ships in (\d+) business day\b'),
    RegExp(r'ships in (\d+) business days\b'),
    RegExp(r'ships in (\d+) week\b'),
    RegExp(r'ships in (\d+) weeks\b'),
    RegExp(r'ships in (\d+) month\b'),
    RegExp(r'ships in (\d+) months\b'),
  ];

  for (final pattern in patterns) {
    final match = pattern.firstMatch(lower);
    if (match != null) {
      final group1 = int.tryParse(match.group(1)!);
      if (group1 != null) {
        return group1 > 7 ? 7 : group1;
      }
    }
  }

  return 5; // Default fallback
}
