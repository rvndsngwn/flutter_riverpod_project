import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{project_name.snakeCase()}}_model/{{project_name.snakeCase()}}_model.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../common.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
class UserState extends _$UserState {
  @override
  User? build() => null;

  /// SIGN UP METHOD
  Future<String> signUp({
    required User user,
    required String password,
  }) async {
    try {
      await ApiClient.account.create(
        email: user.email,
        password: password,
        name: user.fullName,
        userId: user.userId,
      );
      await ApiClient.account.createEmailSession(
        email: user.email,
        password: password,
      );
      HapticFeedback.lightImpact();
      await ApiClient.account.updatePrefs(prefs: user.toJson());

      if (user.phone.isNotEmpty) {
        logger.v("Phone Number Updating ${user.phone}");
        updateUserPhone(user.phone, password);
      }
      await ApiClient.database.createDocument(
        databaseId: Env.appwriteDatabaseId,
        collectionId: Env.userCollectionId,
        documentId: user.userId,
        data: user.toJson(),
      );
      await ApiClient.functions.createExecution(
        functionId: "Env.permissionFunctionId",
        data: jsonEncode({
          "databaseId": Env.appwriteDatabaseId,
          "collectionId": Env.userCollectionId,
          "documentId": user.userId,
          "permissions": user.permissions,
        }),
      );

      return "";
    } on AppwriteException catch (e) {
      logger.e(e);
      return e.message ?? "Error Occurred";
    } catch (error) {
      logger.e(error);
      return "$error";
    }
  }

  /// SIGN IN METHOD
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await ApiClient.account.createEmailSession(
        email: email,
        password: password,
      );
      final User? currentUser = await getCurrentUser();
      if (currentUser != null) {
        state = currentUser;
      }
      return "";
    } on AppwriteException catch (e) {
      logger.e(e);
      return e.message ?? "Error Occurred";
    } catch (error) {
      logger.e(error);
      return "$error";
    }
  }

  /// SIGN OUT METHOD
  Future signOut() async {
    try {
      await ApiClient.account.deleteSession(
        sessionId: 'current',
      );
      state = null;
    } on AppwriteException catch (e) {
      logger.e(e);
      state = null;
    }
  }

  /// GET CURRENT USER
  Future<model.Account?> getCurrentAccount() async {
    try {
      model.Account result = await ApiClient.account.get();
      logger.v(result.toMap());
      if (!result.emailVerification) {
        return null;
      }
      return result;
    } on AppwriteException catch (error) {
      logger.e(error);
      state = null;
      return null;
    } catch (error) {
      logger.e(error);
      state = null;
      return null;
    }
  }

  /// GET CURRENT USER
  Future<User?> getCurrentUser() async {
    try {
      model.Account? result = await getCurrentAccount();
      if (result == null) return null;
      final userData = await ApiClient.database.getDocument(
        databaseId: Env.appwriteDatabaseId,
        collectionId: Env.userCollectionId,
        documentId: result.$id,
      );
      final user = User.fromJson(userData.data);
      state = user;
      return user;
    } on AppwriteException catch (error) {
      logger.e(error);
      state = null;
      return null;
    } catch (error) {
      logger.e(error);
      state = null;
      return null;
    }
  }

  /// UPDATE USER PREFERENCES
  Future<model.Account?> updateUserPre(User user) async {
    try {
      model.Account account = await ApiClient.account.updatePrefs(
        prefs: user.toJson(),
      );
      logger.v(user..toJson());
      return account;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<model.Account?> updateUserName(String userName) async {
    try {
      model.Account user = await ApiClient.account.updateName(name: userName);
      logger.v(user.toMap());
      return user;
    } catch (e) {
      logger.e(e);
      showErrorNotice("Error", e.toString());
      await Future.delayed(const Duration(seconds: 5), () {});
      return null;
    }
  }

  Future<model.Account?> updateUserPhone(
      String phoneNumber, String pass) async {
    try {
      model.Account user = await ApiClient.account.updatePhone(
        phone: phoneNumber,
        password: pass,
      );
      logger.v(user.toMap());
      return user;
    } on AppwriteException catch (e) {
      logger.e(e.message);
      showErrorNotice("Error", e.message ?? "Error Occurred while updating");
      await Future.delayed(const Duration(seconds: 5), () {});
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  /// Create phone session
  Future<model.Token?> createPhoneSession({
    required String phone,
    required String userId,
  }) async {
    try {
      model.Token token = await ApiClient.account.createPhoneSession(
        phone: phone,
        userId: userId,
      );
      logger.v(token.toMap());
      return token;
    } on AppwriteException catch (e) {
      logger.e(e.message);
      showErrorNotice("Error", e.message ?? "An error occurred, try again.");
      await Future.delayed(const Duration(seconds: 3), () {});
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  /// Verify phone session
  Future<bool> verifyPhoneSession({
    required String code,
    required String userId,
  }) async {
    try {
      model.Session session = await ApiClient.account.updatePhoneSession(
        secret: code,
        userId: userId,
      );
      logger.v(session.toMap());
      final User? currentUser = await getCurrentUser();
      if (currentUser != null) {
        state = currentUser;
      }
      return true;
    } on AppwriteException catch (e) {
      logger.e(e.message);
      showErrorNotice("Error", e.message ?? "An error occurred, try again.");
      await Future.delayed(const Duration(seconds: 3), () {});
      return false;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}

class PhoneAuthModel {
  String? phone;
  String? code;
  model.Token? token;

  PhoneAuthModel({
    this.phone,
    this.code,
    this.token,
  });
}

final phoneAuthModelProvider =
    StateProvider<PhoneAuthModel>((ref) => PhoneAuthModel());

@Riverpod(keepAlive: true)
class Admin extends _$Admin {
  @override
  bool build() => false;

  void setAdmin(bool isAdmin) {
    state = isAdmin;
  }
}
