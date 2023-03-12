// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      fullName: json['fullName'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      status: json['status'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      image: json['image'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      locale: json['locale'] as String? ?? '',
      role: json['role'] as String? ?? '',
      website: json['website'] as String? ?? '',
      createdAt: json[r'$createdAt'] as String? ?? '',
      updatedAt: json[r'$updatedAt'] as String? ?? '',
      documentId: json[r'$id'] as String? ?? '',
      collectionId: json[r'$collectionId'] as String? ?? '',
      databaseId: json[r'$databaseId'] as String? ?? '',
      permissions: (json[r'$permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'status': instance.status,
      'userId': instance.userId,
      'verified': instance.verified,
      'image': instance.image,
      'rating': instance.rating,
      'locale': instance.locale,
      'role': instance.role,
      'website': instance.website,
    };
