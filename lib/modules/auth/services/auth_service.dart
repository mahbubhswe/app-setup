import 'package:setupapp/services/firebase_exports.dart';
import '../../../services/app_firebase.dart';

class AuthService {
  final _firebase = AppFirebase();
  final _auth = AppFirebase().auth;
  // final _firestore = AppFirebase().firestore;

  // 🔐 Email/Password Login
  Future<UserCredential> login(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // 🔐 Google Sign-In with Firestore user creation (if new)
  Future<UserCredential?> signInWithGoogle() async {
    final (userCredential, isNewUser) = await _firebase.signInWithGoogle();

    if (userCredential != null && isNewUser) {
    //  final user = userCredential.user!;
      // await _firestore.collection(AppCollections.users).doc(user.uid).set({
      //   'email': user.email,
      //   'createdAt': FieldValue.serverTimestamp(),
      // });
    }

    return userCredential;
  }

  // 🔓 Logout
  Future<void> logout() => _firebase.signOut();

  // 🔄 Auth state stream
  Stream<User?> authState() => _auth.authStateChanges();

  // 👤 Current user
  User? get currentUser => _auth.currentUser;
}
