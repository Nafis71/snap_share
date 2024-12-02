import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth;

  AuthService(FirebaseAuth firebaseAuth): _firebaseAuth = firebaseAuth;

  Future<UserCredential> signUp(String email,String password)async{
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  Future<UserCredential> signIn(String email,String password)async{
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }
}