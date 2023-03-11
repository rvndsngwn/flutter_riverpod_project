// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get fullName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  @JsonKey(name: '\$createdAt', includeToJson: false)
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '\$updatedAt', includeToJson: false)
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: '\$id', includeToJson: false)
  String get documentId => throw _privateConstructorUsedError;
  @JsonKey(name: '\$collectionId', includeToJson: false)
  String get collectionId => throw _privateConstructorUsedError;
  @JsonKey(name: '\$databaseId', includeToJson: false)
  String get databaseId => throw _privateConstructorUsedError;
  @JsonKey(name: '\$permissions', includeToJson: false)
  List<String> get permissions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String fullName,
      String phone,
      String email,
      String address,
      String status,
      String userId,
      bool verified,
      String image,
      String rating,
      String locale,
      String role,
      String website,
      @JsonKey(name: '\$createdAt', includeToJson: false)
          String createdAt,
      @JsonKey(name: '\$updatedAt', includeToJson: false)
          String updatedAt,
      @JsonKey(name: '\$id', includeToJson: false)
          String documentId,
      @JsonKey(name: '\$collectionId', includeToJson: false)
          String collectionId,
      @JsonKey(name: '\$databaseId', includeToJson: false)
          String databaseId,
      @JsonKey(name: '\$permissions', includeToJson: false)
          List<String> permissions});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
    Object? status = null,
    Object? userId = null,
    Object? verified = null,
    Object? image = null,
    Object? rating = null,
    Object? locale = null,
    Object? role = null,
    Object? website = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? documentId = null,
    Object? collectionId = null,
    Object? databaseId = null,
    Object? permissions = null,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      databaseId: null == databaseId
          ? _value.databaseId
          : databaseId // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String phone,
      String email,
      String address,
      String status,
      String userId,
      bool verified,
      String image,
      String rating,
      String locale,
      String role,
      String website,
      @JsonKey(name: '\$createdAt', includeToJson: false)
          String createdAt,
      @JsonKey(name: '\$updatedAt', includeToJson: false)
          String updatedAt,
      @JsonKey(name: '\$id', includeToJson: false)
          String documentId,
      @JsonKey(name: '\$collectionId', includeToJson: false)
          String collectionId,
      @JsonKey(name: '\$databaseId', includeToJson: false)
          String databaseId,
      @JsonKey(name: '\$permissions', includeToJson: false)
          List<String> permissions});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
    Object? status = null,
    Object? userId = null,
    Object? verified = null,
    Object? image = null,
    Object? rating = null,
    Object? locale = null,
    Object? role = null,
    Object? website = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? documentId = null,
    Object? collectionId = null,
    Object? databaseId = null,
    Object? permissions = null,
  }) {
    return _then(_$_User(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      databaseId: null == databaseId
          ? _value.databaseId
          : databaseId // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {this.fullName = '',
      this.phone = '',
      this.email = '',
      this.address = '',
      this.status = '',
      this.userId = '',
      this.verified = false,
      this.image = '',
      this.rating = '',
      this.locale = '',
      this.role = '',
      this.website = '',
      @JsonKey(name: '\$createdAt', includeToJson: false)
          this.createdAt = '',
      @JsonKey(name: '\$updatedAt', includeToJson: false)
          this.updatedAt = '',
      @JsonKey(name: '\$id', includeToJson: false)
          this.documentId = '',
      @JsonKey(name: '\$collectionId', includeToJson: false)
          this.collectionId = '',
      @JsonKey(name: '\$databaseId', includeToJson: false)
          this.databaseId = '',
      @JsonKey(name: '\$permissions', includeToJson: false)
          final List<String> permissions = const []})
      : _permissions = permissions,
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final bool verified;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String rating;
  @override
  @JsonKey()
  final String locale;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String website;
  @override
  @JsonKey(name: '\$createdAt', includeToJson: false)
  final String createdAt;
  @override
  @JsonKey(name: '\$updatedAt', includeToJson: false)
  final String updatedAt;
  @override
  @JsonKey(name: '\$id', includeToJson: false)
  final String documentId;
  @override
  @JsonKey(name: '\$collectionId', includeToJson: false)
  final String collectionId;
  @override
  @JsonKey(name: '\$databaseId', includeToJson: false)
  final String databaseId;
  final List<String> _permissions;
  @override
  @JsonKey(name: '\$permissions', includeToJson: false)
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'User(fullName: $fullName, phone: $phone, email: $email, address: $address, status: $status, userId: $userId, verified: $verified, image: $image, rating: $rating, locale: $locale, role: $role, website: $website, createdAt: $createdAt, updatedAt: $updatedAt, documentId: $documentId, collectionId: $collectionId, databaseId: $databaseId, permissions: $permissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.databaseId, databaseId) ||
                other.databaseId == databaseId) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      phone,
      email,
      address,
      status,
      userId,
      verified,
      image,
      rating,
      locale,
      role,
      website,
      createdAt,
      updatedAt,
      documentId,
      collectionId,
      databaseId,
      const DeepCollectionEquality().hash(_permissions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {final String fullName,
      final String phone,
      final String email,
      final String address,
      final String status,
      final String userId,
      final bool verified,
      final String image,
      final String rating,
      final String locale,
      final String role,
      final String website,
      @JsonKey(name: '\$createdAt', includeToJson: false)
          final String createdAt,
      @JsonKey(name: '\$updatedAt', includeToJson: false)
          final String updatedAt,
      @JsonKey(name: '\$id', includeToJson: false)
          final String documentId,
      @JsonKey(name: '\$collectionId', includeToJson: false)
          final String collectionId,
      @JsonKey(name: '\$databaseId', includeToJson: false)
          final String databaseId,
      @JsonKey(name: '\$permissions', includeToJson: false)
          final List<String> permissions}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get fullName;
  @override
  String get phone;
  @override
  String get email;
  @override
  String get address;
  @override
  String get status;
  @override
  String get userId;
  @override
  bool get verified;
  @override
  String get image;
  @override
  String get rating;
  @override
  String get locale;
  @override
  String get role;
  @override
  String get website;
  @override
  @JsonKey(name: '\$createdAt', includeToJson: false)
  String get createdAt;
  @override
  @JsonKey(name: '\$updatedAt', includeToJson: false)
  String get updatedAt;
  @override
  @JsonKey(name: '\$id', includeToJson: false)
  String get documentId;
  @override
  @JsonKey(name: '\$collectionId', includeToJson: false)
  String get collectionId;
  @override
  @JsonKey(name: '\$databaseId', includeToJson: false)
  String get databaseId;
  @override
  @JsonKey(name: '\$permissions', includeToJson: false)
  List<String> get permissions;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
