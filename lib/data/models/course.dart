import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    required String id,
    required String departmentId,
    required String schoolId,
    required String code,
    required String title,
    required String level,
    String? description,
    @Default(1) int semester,
    @Default(3) int credits,
    String? academicSession,
    String? textbookUrl,
    List<String>? textbookUrls,
    String? textbookSharedKey,
    List<String>? linkedDepartments,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
