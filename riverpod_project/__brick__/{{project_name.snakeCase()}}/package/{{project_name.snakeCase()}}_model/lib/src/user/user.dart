// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'enum.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  factory User({
    @Default('') String fullName,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String address,
    @Default('') String status,
    @Default('') String userId,
    @Default(false) bool verified,
    @Default('') String image,
    @Default('') String rating,
    @Default('') String locale,
    @Default('') String role,
    @Default('') String website,
    @JsonKey(name: '\$createdAt', includeToJson: false)
    @Default('')
        String createdAt,
    @JsonKey(name: '\$updatedAt', includeToJson: false)
    @Default('')
        String updatedAt,
    @JsonKey(name: '\$id', includeToJson: false) @Default('') String documentId,
    @JsonKey(name: '\$collectionId', includeToJson: false)
    @Default('')
        String collectionId,
    @JsonKey(name: '\$databaseId', includeToJson: false)
    @Default('')
        String databaseId,
    @JsonKey(name: '\$permissions', includeToJson: false)
    @Default([])
        List<String> permissions,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  int get ratingInt => int.tryParse(rating) ?? 0;
  double get ratingDouble => double.tryParse(rating) ?? 0.0;
  UserStatus get userStatus => status.toUserStatus();
  UserRole get userRole => role.toUserRole();

  bool get isAdmin => userRole == UserRole.admin;
  bool get isUser => userRole == UserRole.user;
  bool get isActive => userStatus == UserStatus.active;
  bool get isInactive => userStatus == UserStatus.inactive;
  bool get isDeleted => userStatus == UserStatus.deleted;
  bool get isBlocked => userStatus == UserStatus.blocked;
}
