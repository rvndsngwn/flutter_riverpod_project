import 'package:flutter/material.dart';

enum UserStatus {
  active('Active'),
  inactive('Inactive'),
  deleted('Deleted'),
  blocked('Blocked');

  final String status;
  const UserStatus(this.status);
}

extension UserStatusExtension on String {
  UserStatus toUserStatus() {
    switch (this) {
      case 'Active':
        return UserStatus.active;
      case 'Inactive':
        return UserStatus.inactive;
      case 'Deleted':
        return UserStatus.deleted;
      case 'Blocked':
        return UserStatus.blocked;
      default:
        return UserStatus.active;
    }
  }
}

enum UserRole {
  admin('Admin'),
  user('User');

  final String role;
  const UserRole(this.role);
}

extension UserRoleExtension on String {
  UserRole toUserRole() {
    switch (this) {
      case 'Admin':
        return UserRole.admin;
      case 'User':
        return UserRole.user;
      default:
        return UserRole.user;
    }
  }
}

extension StatusExtension on UserStatus {
  Color get color {
    Map map = {
      UserStatus.active: Colors.green,
      UserStatus.blocked: Colors.red,
      UserStatus.inactive: Colors.orange,
      UserStatus.deleted: Colors.red,
    };
    return map[this] ?? Colors.red;
  }

  String get text {
    Map map = {
      UserStatus.active: "Active",
      UserStatus.inactive: "Inactive",
      UserStatus.deleted: "Deleted",
      UserStatus.blocked: "Blocked",
    };
    return map[this] ?? "Unknown";
  }
}

enum Permission {
  read,
  write,
  delete,
  create,
}

enum ServiceType {
  free,
  basic,
  premium,
}

extension StringToServiceType on String {
  ServiceType get toServiceType {
    Map map = {
      "free": ServiceType.free,
      "basic": ServiceType.basic,
      "premium": ServiceType.premium,
    };
    return map[this] ?? ServiceType.free;
  }
}

enum Currency {
  inr,
  usd,
  eur,
  gbp,
  cad,
}

extension StringToCurrency on String {
  Currency get toCurrency {
    Map map = {
      "inr": Currency.inr,
      "usd": Currency.usd,
      "eur": Currency.eur,
      "gbp": Currency.gbp,
      "cad": Currency.cad,
    };
    return map[this] ?? Currency.inr;
  }
}

extension CurrencyToIcon on Currency {
  String get toIcon {
    Map map = {
      Currency.inr: "₹",
      Currency.usd: "\$",
      Currency.eur: "€",
      Currency.gbp: "£",
      Currency.cad: "C\$",
    };
    return map[this] ?? "₹";
  }
}
