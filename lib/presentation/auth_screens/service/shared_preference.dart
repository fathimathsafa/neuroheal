import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _userIdKey = 'userId';
  static const String _userEmailKey = 'userEmail';
  static const String _userNameKey = 'userName';
  static const String _userPhotoUrlKey = 'userPhotoUrl';
  static const String _isEmailVerifiedKey = 'isEmailVerified';

  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Get SharedPreferences instance
  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception('SharedPreferences not initialized. Call init() first.');
    }
    return _preferences!;
  }

  // Save user login state
  static Future<bool> saveUserSession({
    required String userId,
    required String email,
    String? displayName,
    String? photoUrl,
    bool isEmailVerified = false,
  }) async {
    try {
      await preferences.setBool(_isLoggedInKey, true);
      await preferences.setString(_userIdKey, userId);
      await preferences.setString(_userEmailKey, email);

      if (displayName != null) {
        await preferences.setString(_userNameKey, displayName);
      }

      if (photoUrl != null) {
        await preferences.setString(_userPhotoUrlKey, photoUrl);
      }

      await preferences.setBool(_isEmailVerifiedKey, isEmailVerified);

      return true;
    } catch (e) {
      return false;
    }
  }

  // Get login status
  static bool isLoggedIn() {
    return preferences.getBool(_isLoggedInKey) ?? false;
  }

  // Get user ID
  static String? getUserId() {
    return preferences.getString(_userIdKey);
  }

  // Get user email
  static String? getUserEmail() {
    return preferences.getString(_userEmailKey);
  }

  // Get user name
  static String? getUserName() {
    return preferences.getString(_userNameKey);
  }

  // Get user photo URL
  static String? getUserPhotoUrl() {
    return preferences.getString(_userPhotoUrlKey);
  }

  // Get email verification status
  static bool isEmailVerified() {
    return preferences.getBool(_isEmailVerifiedKey) ?? false;
  }

  // Update user name
  static Future<bool> updateUserName(String name) async {
    try {
      await preferences.setString(_userNameKey, name);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Update user photo URL
  static Future<bool> updateUserPhotoUrl(String photoUrl) async {
    try {
      await preferences.setString(_userPhotoUrlKey, photoUrl);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Update email verification status
  static Future<bool> updateEmailVerificationStatus(bool isVerified) async {
    try {
      await preferences.setBool(_isEmailVerifiedKey, isVerified);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Clear user session (logout)
  static Future<bool> clearUserSession() async {
    try {
      await preferences.remove(_isLoggedInKey);
      await preferences.remove(_userIdKey);
      await preferences.remove(_userEmailKey);
      await preferences.remove(_userNameKey);
      await preferences.remove(_userPhotoUrlKey);
      await preferences.remove(_isEmailVerifiedKey);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Clear all preferences
  static Future<bool> clearAllPreferences() async {
    try {
      await preferences.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get all user data as Map
  static Map<String, dynamic> getUserData() {
    return {
      'isLoggedIn': isLoggedIn(),
      'userId': getUserId(),
      'email': getUserEmail(),
      'displayName': getUserName(),
      'photoUrl': getUserPhotoUrl(),
      'isEmailVerified': isEmailVerified(),
    };
  }
}
