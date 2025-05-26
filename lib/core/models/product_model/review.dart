import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  factory Review({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

extension ReviewExtensions on Review {
  String get formattedDate {
    final dateTime = date ?? DateTime.now();
    return DateFormat('d MMMM y').format(dateTime);
  }

  String get reviewerInitialsName {
    if (reviewerName == null || reviewerName!.trim().isEmpty) return '';
    final parts = reviewerName!.trim().split(RegExp(r'\s+'));
    final initials = parts.take(2).map((e) => e[0]).join();
    return initials.toUpperCase();
  }
}
