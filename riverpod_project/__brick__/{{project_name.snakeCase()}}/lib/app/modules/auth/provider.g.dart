// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userStateHash() => r'ac04d109b976318e34fd2553f35853006bc17435';

/// See also [UserState].
@ProviderFor(UserState)
final userStateProvider = NotifierProvider<UserState, User?>.internal(
  UserState.new,
  name: r'userStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserState = Notifier<User?>;
String _$adminHash() => r'ed7ec72ed6bd96b8dc528c54258cade80abc616c';

/// See also [Admin].
@ProviderFor(Admin)
final adminProvider = NotifierProvider<Admin, bool>.internal(
  Admin.new,
  name: r'adminProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$adminHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Admin = Notifier<bool>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
