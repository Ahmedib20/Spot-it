import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<User?> signinWithEmailAndPass({
    @required String email,
    @required String password,
  });
  Future<UserCredential> signinWithGoogle();

  Future<UserCredential> signUp({
    @required String email,
    @required String password,
  });
}
