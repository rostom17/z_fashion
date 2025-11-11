import 'package:flutter/material.dart';

enum AuthStatus { authchecking, authenticated, unauthenticated }

class AuthService extends ChangeNotifier {
  AuthStatus _authStatus = AuthStatus.authchecking;
  bool _isLoggedIn = true;

  AuthStatus get authStatus => _authStatus;
  bool get isLoggenIn => _isLoggedIn;

  Future<void> checkAuth() async {
    _authStatus = AuthStatus.authchecking;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    //token niye kaj korbo
    //if else lagabo authenticated ki na??

    final dummyToken = true;
    if (dummyToken) {
      _isLoggedIn = true;
      _authStatus = AuthStatus.authenticated;
    } else {
      _isLoggedIn = false;
      _authStatus = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
