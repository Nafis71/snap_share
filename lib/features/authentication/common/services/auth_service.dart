import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStoreInstance;

  AuthService(this._firebaseAuth, this._fireStoreInstance);

  Future<UserCredential> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<UserCredential> signIn(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<void> uploadProfile(Map<String, dynamic> json, String uId) async {
    await FirebaseFirestore.instance.collection('users').doc(uId).set(json);
  }

  Future<bool> verifyUser(String uId) async {
    DocumentSnapshot document =
        await _fireStoreInstance.collection('users').doc(uId).get();
    return document.get("hasUpdatedInfo");
  }

  Future<Map<String, dynamic>> fetchUser(String uId) async {
    DocumentSnapshot documentSnapshot =
        await _fireStoreInstance.collection('users').doc(uId).get();
    return documentSnapshot.data() as Map<String, dynamic>;
  }
}
