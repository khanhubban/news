import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/repositories_impl/auth_repository_impl.dart';
import 'package:news_app/domain/repositories/auth_repository.dart';

// 1. Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(FirebaseAuth.instance);
});

// 2. Auth State Changes Provider
final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges;
});

