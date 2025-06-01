import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';

import '../../../generated/locale_keys.g.dart';
import 'dimensions.dart';
import 'meta.dart';
import 'review.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  static Product loading() {
    return Product(
      id: -1,
      title: 'Loading',
      thumbnail: '',
      price: 0.0,
      rating: 0.0,
      stock: 0,
      reviews: [],
      brand: 'loading',
      images: [],
      tags: ["loading", "loading", "loading"],
      description: "loading description here .....",
      category: "loading",
      discountPercentage: 0.0,
      sku: "loading",
      weight: 0,
      shippingInformation: "loading",
      warrantyInformation: "loading",
      availabilityStatus: "loading",
      minimumOrderQuantity: 0,
      returnPolicy: "loading",
    );
  }
}

extension ProductExtensions on Product {
  bool get isAvailable => stock != null && stock! > 0;

  String get formattedPrice => price?.toStringAsFixed(2) ?? '0.00';

  String get formattedDiscountPercentage =>
      '- ${discountPercentage?.toStringAsFixed(2) ?? '0.00'}%';

  String get formattedPriceBeforeDiscount {
    if (discountPercentage != null && discountPercentage! > 0) {
      final discountedPrice = price! / (1 - discountPercentage! / 100);
      return discountedPrice.toStringAsFixed(2);
    }
    return formattedPrice;
  }

  String formattedStock(BuildContext context) {
    if (stock == null) return context.tr(LocaleKeys.product_not_available);

    if (stock! > 0) {
      return stock! > 10
          ? context.tr(LocaleKeys.product_in_stock, args: [stock.toString()])
          : context.tr(LocaleKeys.product_only_stock, args: [stock.toString()]);
    } else {
      return context.tr(LocaleKeys.product_out_of_stock);
    }
  }

  String formattedWarranty(BuildContext context) {
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
          return context.tr(
            LocaleKeys.product_warranty_months,
            args: [number!],
          );
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

  String formattedShipping(BuildContext context) {
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
    final monthsMatch = RegExp(
      r'ships in (\d+) months',
    ).firstMatch(lower ?? '');

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

  String formattedReturnPolicy(BuildContext context) {
    final lower = returnPolicy!.toLowerCase().trim();

    if (lower == 'no return policy') {
      return context.tr(LocaleKeys.product_return_policy_none);
    }

    final match = RegExp(r'(\d+)\s+days?\s+return policy').firstMatch(lower);
    if (match != null) {
      final days = int.parse(match.group(1)!);
      if (days == 1) {
        return context.tr(
          LocaleKeys.product_return_policy_days,
          args: [days.toString()],
        );
      } else {
        return context.tr(
          LocaleKeys.product_return_policy_days_plural,
          args: [days.toString()],
        );
      }
    }

    // fallback if format is unexpected
    return returnPolicy!;
  }

  String formattedReviewsCount(BuildContext context) {
    return context.plural(
      LocaleKeys.product_reviews_count,
      reviews?.length ?? 0,
      args: [reviews?.length.toString() ?? '0'],
    );
  }

  String get formattedWeight => weight != null ? '$weight g' : 'N/A';
  String get formattedDimensions =>
      dimensions != null
          ? '${dimensions!.depth} x ${dimensions!.width} x ${dimensions!.height} cm'
          : 'N/A';

  ProductItemEntity toProductItem() {
    return ProductItemEntity(
      id: id.toString(),
      title: title ?? '',
      imageUrl: thumbnail ?? '',
      price: price ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      reviewsCount: reviews?.length ?? 0,
      brand: brand ?? '',
    );
  }
}
