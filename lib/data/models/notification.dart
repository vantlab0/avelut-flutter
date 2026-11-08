import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    required String userId,
    @Default('general') String type,
    String? title,
    String? message,
    String? body,
    String? link,
    String? actionUrl,
    @Default(false) bool isRead,
    Map<String, dynamic>? data,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);
}
