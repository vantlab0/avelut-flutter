import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    required String userId,
    @Default('free') String planId,
    @Default('free') String planType,
    @Default('active') String status,
    String? reference,
    String? paystackReference,
    num? amount,
    @Default('NGN') String currency,
    @Default(1) int dailyTopicAllowance,
    @Default(0) int topicsUsedToday,
    DateTime? lastResetDate,
    @Default(0) int unlockedTopicsPack,
    DateTime? startsAt,
    DateTime? expiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}
