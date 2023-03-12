import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  /// Google Maps API key
  @EnviedField(varName: 'googleMapKey')
  static String googleMapKey = _Env.googleMapKey;

  /// The Weather key
  @EnviedField(varName: 'weatherKey')
  static String weatherKey = _Env.weatherKey;

  /// Razorpay order URl
  @EnviedField(varName: 'razorpayOrderUrl')
  static String razorpayOrderUrl = _Env.razorpayOrderUrl;

  /// Razorpay key ID
  @EnviedField(varName: 'razorpayKeyId')
  static String razorpayKeyId = _Env.razorpayKeyId;

  /// Razorpay key secret
  @EnviedField(varName: 'razorpayKeySecret')
  static String razorpayKeySecret = _Env.razorpayKeySecret;

  /// Google Places API key
  @EnviedField(varName: 'kGoogleApiKey')
  static String kGoogleApiKey = _Env.kGoogleApiKey;

  /// Appwrite endpoint
  @EnviedField(varName: 'appwriteEndpoint')
  static String appwriteEndpoint = _Env.appwriteEndpoint;

  /// Appwrite project ID
  @EnviedField(varName: 'appwriteProjectId')
  static String appwriteProjectId = _Env.appwriteProjectId;

  /// Appwrite database ID
  @EnviedField(varName: 'appwriteDatabaseId')
  static String appwriteDatabaseId = _Env.appwriteDatabaseId;

  /// User collection id
  @EnviedField(varName: 'userCollectionId')
  static String userCollectionId = _Env.userCollectionId;

  /// Appwrite storage BucketId
  @EnviedField(varName: 'storageBucketId')
  static String storageBucketId = _Env.storageBucketId;
}
