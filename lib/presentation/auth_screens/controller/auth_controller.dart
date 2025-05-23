// import 'package:flutter/foundation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:neuroheal/presentation/auth_screens/model/user_model.dart';
// import 'package:neuroheal/presentation/auth_screens/service/auth_service.dart';

// enum AuthStatus { initial, authenticated, unauthenticated, loading }

// class AuthProvider with ChangeNotifier {
//   final AuthService _authService = AuthService();

//   AuthStatus _status = AuthStatus.initial;
//   UserModel? _user;
//   String? _errorMessage;
//   bool _isLoading = false;

//   // Getters
//   AuthStatus get status => _status;
//   UserModel? get user => _user;
//   String? get errorMessage => _errorMessage;
//   bool get isLoading => _isLoading;
//   bool get isAuthenticated => _status == AuthStatus.authenticated;

//   AuthProvider() {
//     _initAuthListener();
//   }

//   // Initialize auth state listener
//   void _initAuthListener() {
//     _authService.authStateChanges.listen((User? user) {
//       if (user != null) {
//         _user = UserModel.fromFirebaseUser(user);
//         _status = AuthStatus.authenticated;
//       } else {
//         _user = null;
//         _status = AuthStatus.unauthenticated;
//       }
//       notifyListeners();
//     });
//   }

//   // Set loading state
//   void _setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Set error message
//   void _setError(String? message) {
//     _errorMessage = message;
//     notifyListeners();
//   }

//   // Clear error message
//   void clearError() {
//     _errorMessage = null;
//     notifyListeners();
//   }

//   // Sign up with email and password
//   Future<bool> signUp({
//     required String email,
//     required String password,
//     String? displayName,
//   }) async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       final result = await _authService.signUpWithEmailAndPassword(
//         email: email,
//         password: password,
//         displayName: displayName,
//       );

//       if (result.success) {
//         // Send email verification
//         await sendEmailVerification();
//         return true;
//       } else {
//         _setError(result.message);
//         return false;
//       }
//     } catch (e) {
//       _setError('An unexpected error occurred');
//       return false;
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Sign in with email and password
//   Future<bool> signIn({required String email, required String password}) async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       final result = await _authService.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (result.success) {
//         return true;
//       } else {
//         _setError(result.message);
//         return false;
//       }
//     } catch (e) {
//       _setError('An unexpected error occurred');
//       return false;
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Sign in with Google
//   // Future<bool> signInWithGoogle() async {
//   //   _setLoading(true);
//   //   _setError(null);

//   //   try {
//   //     final result = await _authService.signInWithGoogle();

//   //     if (result.success) {
//   //       return true;
//   //     } else {
//   //       _setError(result.message);
//   //       return false;
//   //     }
//   //   } catch (e) {
//   //     _setError('Google sign in failed');
//   //     return false;
//   //   } finally {
//   //     _setLoading(false);
//   //   }
//   // }

//   // // Sign in with Facebook
//   // Future<bool> signInWithFacebook() async {
//   //   _setLoading(true);
//   //   _setError(null);

//   //   try {
//   //     final result = await _authService.signInWithFacebook();

//   //     if (result.success) {
//   //       return true;
//   //     } else {
//   //       _setError(result.message);
//   //       return false;
//   //     }
//   //   } catch (e) {
//   //     _setError('Facebook sign in failed');
//   //     return false;
//   //   } finally {
//   //     _setLoading(false);
//   //   }
//   // }

//   // Send password reset email
//   Future<bool> sendPasswordResetEmail(String email) async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       final result = await _authService.sendPasswordResetEmail(email);

//       if (result.success) {
//         return true;
//       } else {
//         _setError(result.message);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to send password reset email');
//       return false;
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Send email verification
//   Future<bool> sendEmailVerification() async {
//     try {
//       final result = await _authService.sendEmailVerification();

//       if (result.success) {
//         return true;
//       } else {
//         _setError(result.message);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to send verification email');
//       return false;
//     }
//   }

//   // Sign out
//   // Future<void> signOut() async {
//   //   _setLoading(true);

//   //   try {
//   //     await _authService.signOut();
//   //     _user = null;
//   //     _status = AuthStatus.unauthenticated;
//   //     _setError(null);
//   //   } catch (e) {
//   //     _setError('Failed to sign out');
//   //   } finally {
//   //     _setLoading(false);
//   //   }
//   // }

//   // Delete account
//   Future<bool> deleteAccount() async {
//     _setLoading(true);
//     _setError(null);

//     try {
//       final result = await _authService.deleteAccount();

//       if (result.success) {
//         _user = null;
//         _status = AuthStatus.unauthenticated;
//         return true;
//       } else {
//         _setError(result.message);
//         return false;
//       }
//     } catch (e) {
//       _setError('Failed to delete account');
//       return false;
//     } finally {
//       _setLoading(false);
//     }
//   }

//   // Reload user data
//   Future<void> reloadUser() async {
//     final currentUser = _authService.currentUser;
//     if (currentUser != null) {
//       await currentUser.reload();
//       _user = UserModel.fromFirebaseUser(_authService.currentUser);
//       notifyListeners();
//     }
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neuroheal/presentation/auth_screens/model/user_model.dart';
import 'package:neuroheal/presentation/auth_screens/service/auth_service.dart';
import 'package:neuroheal/presentation/auth_screens/service/shared_preference.dart';

enum AuthStatus { initial, authenticated, unauthenticated, loading }

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  AuthStatus _status = AuthStatus.initial;
  UserModel? _user;
  String? _errorMessage;
  bool _isLoading = false;

  // Getters
  AuthStatus get status => _status;
  UserModel? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  AuthProvider() {
    _initializeAuth();
  }

  // Initialize authentication state
  Future<void> _initializeAuth() async {
    _setLoading(true);

    // Check for auto login
    await _checkAutoLogin();

    // Initialize auth state listener
    _initAuthListener();

    _setLoading(false);
  }

  // Check for automatic login
  Future<void> _checkAutoLogin() async {
    try {
      final result = await _authService.autoLogin();

      if (result.success && result.user != null) {
        _user = result.user;
        _status = AuthStatus.authenticated;
      } else {
        _status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  // Initialize auth state listener
  void _initAuthListener() {
    _authService.authStateChanges.listen((User? user) {
      if (user != null) {
        _user = UserModel.fromFirebaseUser(user);
        _status = AuthStatus.authenticated;

        // Update SharedPreferences with latest user data
        _updateSharedPreferences(user);
      } else {
        _user = null;
        _status = AuthStatus.unauthenticated;

        // Clear SharedPreferences if user is null
        SharedPreferencesService.clearUserSession();
      }
      notifyListeners();
    });
  }

  // Update SharedPreferences with user data
  Future<void> _updateSharedPreferences(User user) async {
    await SharedPreferencesService.saveUserSession(
      userId: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
      isEmailVerified: user.emailVerified,
    );
  }

  // Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Set error message
  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Sign up with email and password
  Future<bool> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await _authService.signUpWithEmailAndPassword(
        email: email,
        password: password,
        displayName: displayName,
      );

      if (result.success) {
        // Send email verification
        await sendEmailVerification();
        return true;
      } else {
        _setError(result.message);
        return false;
      }
    } catch (e) {
      _setError('An unexpected error occurred');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Sign in with email and password
  Future<bool> signIn({required String email, required String password}) async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.success) {
        return true;
      } else {
        _setError(result.message);
        return false;
      }
    } catch (e) {
      _setError('An unexpected error occurred');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Send password reset email
  Future<bool> sendPasswordResetEmail(String email) async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await _authService.sendPasswordResetEmail(email);

      if (result.success) {
        return true;
      } else {
        _setError(result.message);
        return false;
      }
    } catch (e) {
      _setError('Failed to send password reset email');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Send email verification
  Future<bool> sendEmailVerification() async {
    try {
      final result = await _authService.sendEmailVerification();

      if (result.success) {
        return true;
      } else {
        _setError(result.message);
        return false;
      }
    } catch (e) {
      _setError('Failed to send verification email');
      return false;
    }
  }

  // Sign out
  Future<bool> signOut() async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await _authService.signOut();

      if (result.success) {
        _user = null;
        _status = AuthStatus.unauthenticated;
        return true;
      } else {
        _setError(result.message);
        return false;
      }
    } catch (e) {
      _setError('Failed to sign out');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Delete account
  Future<bool> deleteAccount() async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await _authService.deleteAccount();

      if (result.success) {
        _user = null;
        _status = AuthStatus.unauthenticated;
        return true;
      } else {
        _setError(result.message);
        return false;
      }
    } catch (e) {
      _setError('Failed to delete account');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Update user profile
  Future<bool> updateUserProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    _setLoading(true);
    _setError(null);

    try {
      final result = await _authService.updateUserProfile(
        displayName: displayName,
        photoUrl: photoUrl,
      );

      if (result.success && result.user != null) {
        _user = result.user;
        notifyListeners();
        return true;
      } else {
        _setError(result.message);
        return false;
      }
    } catch (e) {
      _setError('Failed to update profile');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Reload user data
  Future<void> reloadUser() async {
    final currentUser = _authService.currentUser;
    if (currentUser != null) {
      await currentUser.reload();
      _user = UserModel.fromFirebaseUser(_authService.currentUser);

      // Update SharedPreferences
      if (_authService.currentUser != null) {
        await _updateSharedPreferences(_authService.currentUser!);
      }

      notifyListeners();
    }
  }

  // Get cached user data from SharedPreferences
  Map<String, dynamic> getCachedUserData() {
    return _authService.getCachedUserData();
  }

  // Check if user is logged in from cache
  bool isLoggedInFromCache() {
    return _authService.isUserLoggedIn();
  }
}
