import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic.freezed.dart';
part 'topic.g.dart';

@freezed
class Topic with _$Topic {
  const factory Topic({
    required String id,
    required String courseId,
    String? title,
    String? topicName,
    String? overview,
    String? description,
    String? content,
    @Default(0) int topicOrder,
    @Default(30) int estimatedMinutes,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
}
