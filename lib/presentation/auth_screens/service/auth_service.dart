import 'package:firebase_auth/firebase_auth.dart';
import 'package:neuroheal/presentation/auth_screens/model/user_model.dart';


// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   //final GoogleSignIn _googleSignIn = GoogleSignIn();

//   // Get current user
//   User? get currentUser => _auth.currentUser;

//   // Auth state stream
//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   // Convert Firebase User to UserModel
//   UserModel? _userFromFirebaseUser(User? user) {
//     return user != null ? UserModel.fromFirebaseUser(user) : null;
//   }

//   // Sign up with email and password
//   Future<AuthResult> signUpWithEmailAndPassword({
//     required String email,
//     required String password,
//     String? displayName,
//   }) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       User? user = result.user;
//       if (user != null && displayName != null) {
//         await user.updateDisplayName(displayName);
//         await user.reload();
//         user = _auth.currentUser;
//       }

//       return AuthResult(
//         success: true,
//         user: _userFromFirebaseUser(user),
//         message: 'Account created successfully',
//       );
//     } on FirebaseAuthException catch (e) {
//       return AuthResult(
//         success: false,
//         errorCode: e.code,
//         message: _getErrorMessage(e.code),
//       );
//     } catch (e) {
//       return AuthResult(
//         success: false,
//         message: 'An unexpected error occurred',
//       );
//     }
//   }

//   // Sign in with email and password
//   Future<AuthResult> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       return AuthResult(
//         success: true,
//         user: _userFromFirebaseUser(result.user),
//         message: 'Signed in successfully',
//       );
//     } on FirebaseAuthException catch (e) {
//       return AuthResult(
//         success: false,
//         errorCode: e.code,
//         message: _getErrorMessage(e.code),
//       );
//     } catch (e) {
//       return AuthResult(
//         success: false,
//         message: 'An unexpected error occurred',
//       );
//     }
//   }

//   // Sign in with Google
//   // Future<AuthResult> signInWithGoogle() async {
//   //   try {
//   //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//   //     if (googleUser == null) {
//   //       return AuthResult(
//   //         success: false,
//   //         message: 'Google sign in was cancelled',
//   //       );
//   //     }

//   //     final GoogleSignInAuthentication googleAuth =
//   //         await googleUser.authentication;

//   //     final credential = GoogleAuthProvider.credential(
//   //       accessToken: googleAuth.accessToken,
//   //       idToken: googleAuth.idToken,
//   //     );

//   //     UserCredential result = await _auth.signInWithCredential(credential);

//   //     return AuthResult(
//   //       success: true,
//   //       user: _userFromFirebaseUser(result.user),
//   //       message: 'Signed in with Google successfully',
//   //     );
//   //   } catch (e) {
//   //     return AuthResult(success: false, message: 'Google sign in failed');
//   //   }
//   // }

//   // // Sign in with Facebook
//   // Future<AuthResult> signInWithFacebook() async {
//   //   try {
//   //     final LoginResult result = await FacebookAuth.instance.login();

//   //     if (result.status == LoginStatus.success) {
//   //       final OAuthCredential credential = FacebookAuthProvider.credential(
//   //         result.accessToken!.token,
//   //       );

//   //       UserCredential userCredential = await _auth.signInWithCredential(
//   //         credential,
//   //       );

//   //       return AuthResult(
//   //         success: true,
//   //         user: _userFromFirebaseUser(userCredential.user),
//   //         message: 'Signed in with Facebook successfully',
//   //       );
//   //     } else {
//   //       return AuthResult(
//   //         success: false,
//   //         message: 'Facebook sign in was cancelled',
//   //       );
//   //     }
//   //   } catch (e) {
//   //     return AuthResult(success: false, message: 'Facebook sign in failed');
//   //   }
//   // }

//   // Send password reset email
//   Future<AuthResult> sendPasswordResetEmail(String email) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//       return AuthResult(success: true, message: 'Password reset email sent');
//     } on FirebaseAuthException catch (e) {
//       return AuthResult(
//         success: false,
//         errorCode: e.code,
//         message: _getErrorMessage(e.code),
//       );
//     } catch (e) {
//       return AuthResult(
//         success: false,
//         message: 'Failed to send password reset email',
//       );
//     }
//   }

//   // Send email verification
//   Future<AuthResult> sendEmailVerification() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null && !user.emailVerified) {
//         await user.sendEmailVerification();
//         return AuthResult(success: true, message: 'Verification email sent');
//       }
//       return AuthResult(
//         success: false,
//         message: 'No user found or email already verified',
//       );
//     } catch (e) {
//       return AuthResult(
//         success: false,
//         message: 'Failed to send verification email',
//       );
//     }
//   }

//   // Sign out
//   // Future<void> signOut() async {
//   //   await _googleSignIn.signOut();
//   //   await FacebookAuth.instance.logOut();
//   //   await _auth.signOut();
//   // }

//   // Delete account
//   Future<AuthResult> deleteAccount() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         await user.delete();
//         return AuthResult(
//           success: true,
//           message: 'Account deleted successfully',
//         );
//       }
//       return AuthResult(success: false, message: 'No user found');
//     } on FirebaseAuthException catch (e) {
//       return AuthResult(
//         success: false,
//         errorCode: e.code,
//         message: _getErrorMessage(e.code),
//       );
//     } catch (e) {
//       return AuthResult(success: false, message: 'Failed to delete account');
//     }
//   }

//   // Error message helper
//   String _getErrorMessage(String errorCode) {
//     switch (errorCode) {
//       case 'user-not-found':
//         return 'No user found with this email address';
//       case 'wrong-password':
//         return 'Incorrect password';
//       case 'email-already-in-use':
//         return 'An account already exists with this email address';
//       case 'weak-password':
//         return 'Password is too weak';
//       case 'invalid-email':
//         return 'Invalid email address';
//       case 'user-disabled':
//         return 'This account has been disabled';
//       case 'too-many-requests':
//         return 'Too many attempts. Please try again later';
//       case 'requires-recent-login':
//         return 'Please re-authenticate to perform this action';
//       default:
//         return 'An error occurred. Please try again';
//     }
//   }
// }

// // Auth result model
// class AuthResult {
//   final bool success;
//   final UserModel? user;
//   final String? message;
//   final String? errorCode;

//   AuthResult({required this.success, this.user, this.message, this.errorCode});
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:neuroheal/presentation/auth_screens/model/user_model.dart';
import 'package:neuroheal/presentation/auth_screens/service/shared_preference.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Auth state stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Convert Firebase User to UserModel
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  // Check if user is logged in from SharedPreferences
  bool isUserLoggedIn() {
    return SharedPreferencesService.isLoggedIn();
  }

  // Get user data from SharedPreferences
  Map<String, dynamic> getCachedUserData() {
    return SharedPreferencesService.getUserData();
  }

  // Sign up with email and password
  Future<AuthResult> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;
      if (user != null && displayName != null) {
        await user.updateDisplayName(displayName);
        await user.reload();
        user = _auth.currentUser;
      }

      // Save user session to SharedPreferences
      if (user != null) {
        await SharedPreferencesService.saveUserSession(
          userId: user.uid,
          email: user.email ?? email,
          displayName: user.displayName ?? displayName,
          photoUrl: user.photoURL,
          isEmailVerified: user.emailVerified,
        );
      }

      return AuthResult(
        success: true,
        user: _userFromFirebaseUser(user),
        message: 'Account created successfully',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        errorCode: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'An unexpected error occurred',
      );
    }
  }

  // Sign in with email and password
  Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      // Save user session to SharedPreferences
      if (user != null) {
        await SharedPreferencesService.saveUserSession(
          userId: user.uid,
          email: user.email ?? email,
          displayName: user.displayName,
          photoUrl: user.photoURL,
          isEmailVerified: user.emailVerified,
        );
      }

      return AuthResult(
        success: true,
        user: _userFromFirebaseUser(user),
        message: 'Signed in successfully',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        errorCode: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'An unexpected error occurred',
      );
    }
  }

  // Send password reset email
  Future<AuthResult> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return AuthResult(success: true, message: 'Password reset email sent');
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        errorCode: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Failed to send password reset email',
      );
    }
  }

  // Send email verification
  Future<AuthResult> sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return AuthResult(success: true, message: 'Verification email sent');
      }
      return AuthResult(
        success: false,
        message: 'No user found or email already verified',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Failed to send verification email',
      );
    }
  }

  // Sign out
  Future<AuthResult> signOut() async {
    try {
      // Sign out from Firebase
      await _auth.signOut();
      
      // Clear user session from SharedPreferences
      await SharedPreferencesService.clearUserSession();
      
      return AuthResult(
        success: true,
        message: 'Signed out successfully',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Failed to sign out',
      );
    }
  }

  // Delete account
  Future<AuthResult> deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.delete();
        
        // Clear user session from SharedPreferences
        await SharedPreferencesService.clearUserSession();
        
        return AuthResult(
          success: true,
          message: 'Account deleted successfully',
        );
      }
      return AuthResult(success: false, message: 'No user found');
    } on FirebaseAuthException catch (e) {
      return AuthResult(
        success: false,
        errorCode: e.code,
        message: _getErrorMessage(e.code),
      );
    } catch (e) {
      return AuthResult(success: false, message: 'Failed to delete account');
    }
  }

  // Auto login if user session exists
  Future<AuthResult> autoLogin() async {
    try {
      if (SharedPreferencesService.isLoggedIn()) {
        User? currentUser = _auth.currentUser;
        
        if (currentUser != null) {
          // User is still signed in to Firebase
          return AuthResult(
            success: true,
            user: _userFromFirebaseUser(currentUser),
            message: 'Auto login successful',
          );
        } else {
          // User session exists in SharedPreferences but not in Firebase
          // Clear the stale session
          await SharedPreferencesService.clearUserSession();
          return AuthResult(
            success: false,
            message: 'Session expired',
          );
        }
      }
      
      return AuthResult(
        success: false,
        message: 'No saved session found',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Auto login failed',
      );
    }
  }

  // Update user profile
  Future<AuthResult> updateUserProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        if (displayName != null) {
          await user.updateDisplayName(displayName);
          await SharedPreferencesService.updateUserName(displayName);
        }
        
        if (photoUrl != null) {
          await user.updatePhotoURL(photoUrl);
          await SharedPreferencesService.updateUserPhotoUrl(photoUrl);
        }
        
        await user.reload();
        
        return AuthResult(
          success: true,
          user: _userFromFirebaseUser(_auth.currentUser),
          message: 'Profile updated successfully',
        );
      }
      
      return AuthResult(
        success: false,
        message: 'No user found',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Failed to update profile',
      );
    }
  }

  // Error message helper
  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found with this email address';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'An account already exists with this email address';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'requires-recent-login':
        return 'Please re-authenticate to perform this action';
      default:
        return 'An error occurred. Please try again';
    }
  }
}

// Auth result model
class AuthResult {
  final bool success;
  final UserModel? user;
  final String? message;
  final String? errorCode;

  AuthResult({required this.success, this.user, this.message, this.errorCode});
}