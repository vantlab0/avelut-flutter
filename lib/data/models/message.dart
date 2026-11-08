import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String chatId,
    required String senderId,
    String? text,
    String? mediaUrl,
    String? mediaType,
    String? replyTo,
    @Default(false) bool isDeleted,
    @Default(false) bool isDelivered,
    @Default(false) bool isRead,
    required DateTime createdAt,
    String? audioUrl,
    int? audioDuration,
    String? imageUrl,
    List<String>? attachments,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
