import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    String? email,
    String? fullName,
    String? username,
    String? avatarUrl,
    String? schoolId,
    String? schoolName,
    String? collegeId,
    String? departmentId,
    String? departmentName,
    String? level,
    @Default(0) int xp,
    @Default(0) int streak,
    DateTime? lastActiveDate,
    @Default(50) int aiCredits,
    @Default(120) int liveTutorialMinutes,
    @Default(false) bool isAdmin,
    @Default(false) bool isPaidSubscriber,
    String? fcmToken,
    @Default(false) bool isOnline,
    DateTime? lastSeen,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? role,
    bool? isActivated,
    bool? privacyConsent,
    bool? hasCompletedTour,
    String? subscriptionStatus,
    String? personalApiKey,
    bool? usePersonalToken,
    String? paystackReference,
    String? dvaAccountNumber,
    String? dvaBankName,
    String? dvaAccountName,
    String? paystackCustomerCode,
    String? selectedFreeCourseId,
    String? defaultSemesterTab,
    String? coverPhoto,
    String? bio,
    String? contactDetails,
    int? totalTokensUsed,
    int? timeSpentInApp,
    String? referralCode,
    String? referredBy,
    int? referralsCount,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
