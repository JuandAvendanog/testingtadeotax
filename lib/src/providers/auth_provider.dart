import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  // FirebaseAuth
  late FirebaseAuth _firebaseAuth;
  late BuildContext context;

  AuthProvider () {
    _firebaseAuth = FirebaseAuth.instance;
  }

  // User
  User? getUser() {
    return _firebaseAuth.currentUser;
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;

    if (currentUser == null) {
      return false;
    }
    return true;
  }

  void checkIfUserIsLogged(BuildContext context, String typeUser) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //QUE EL USUARIO ESTA LOGEADO
      if (user != null && typeUser != null) {
        if (typeUser == 'client') {
          Navigator.pushNamedAndRemoveUntil(
              context, 'client/map', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, 'driver/map', (route) => false);
        }
        print('El usuario está logeado');
      } else {
        print('El usuario no esta logeado');
      }
    });
  }

// login
  Future<bool> login(String email, String password) async {
    String? errorMessage;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      errorMessage = error.code;
    }

    if (errorMessage != null) {
      throw errorMessage;
    }
    return true;
  }

  Future<bool> register(String email, password) async {
    String? errorMessage;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      errorMessage = error.code;
    }

    if (errorMessage != null) {
      throw errorMessage;
    }
    return true;
  }

  Future<void> signOut() async {
    await Future.wait([_firebaseAuth.signOut()]);
  }
}
