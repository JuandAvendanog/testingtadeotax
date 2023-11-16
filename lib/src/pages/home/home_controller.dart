import "package:flutter/material.dart";
import 'package:tadeotax_android/src/providers/auth_provider.dart';
import 'package:tadeotax_android/src/utils/shared_pref.dart';

class HomeController {
  late BuildContext context;
  late SharedPref _sharePref;

  late AuthProvider _authProvider;
  late String _typeUser;

  Future init(BuildContext context) async {
    this.context = context;
    _sharePref = SharedPref();
    _authProvider = AuthProvider();
    _typeUser = await _sharePref.read('typeUser');
    //_authProvider.checkIfUserIsLogged(context, _typeUser);
    checkIfUserIsAuth();
  }

  void checkIfUserIsAuth() {
    bool isSigned = _authProvider.isSignedIn();
    if (isSigned) {
      if (_typeUser == 'client') {
        Navigator.pushNamedAndRemoveUntil(
            context, 'client/map', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, 'driver/map', (route) => false);
      }
    }
  }

  void goToLoginPage(String typeUser) {
    saveTypeUser(typeUser);
    Navigator.pushNamed(context, "login");
  }

  void saveTypeUser(String typeUser) async {
    _sharePref.save('typeUser', typeUser);
  }
}
