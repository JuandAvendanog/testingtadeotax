import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tadeotax_android/src/models/cliente.dart';
import 'package:tadeotax_android/src/models/driver.dart';
import 'package:tadeotax_android/src/providers/auth_provider.dart';
import 'package:tadeotax_android/src/providers/client_provider.dart';
import 'package:tadeotax_android/src/providers/driver_provider.dart';
import 'package:tadeotax_android/src/utils/shared_pref.dart';
import 'package:tadeotax_android/src/utils/snackbar.dart' as utils;

import '../../utils/my_progress_dialog.dart';

class loginController {
  late BuildContext context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AuthProvider _authProvider;
  late ProgressDialog _progressDialog;
  late DriverProvider _driverProvider;
  late ClientProvider _clientProvider;

  late SharedPref _sharedPref;
  late String _typeUser;

  Future init(BuildContext context) async {
    this.context = context;
    _authProvider = AuthProvider();
    _driverProvider = DriverProvider();
    _clientProvider = ClientProvider();

    _progressDialog =
        MyProgressDialog.createProgressDialog(context, "Espere un momento...");
    _sharedPref = SharedPref();
    _typeUser = await _sharedPref.read('typeUser');

    print('******************** TIPO DE USUARIO ********************************');
    print(_typeUser);
  }

  void goToRegisterPage() {
    if (_typeUser == 'client'){
      Navigator.pushNamed(context, 'client/register');
    }else{
      Navigator.pushNamed(context, 'driver/register');
    }
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text;

    _progressDialog.show();

    try {
      bool isLogin = await _authProvider.login(email, password);
      _progressDialog.hide();

      if (isLogin) {
        if (_typeUser == 'client'){
          Client client = await _clientProvider.getById(_authProvider.getUser()!.uid);
          print ('CLIENT: $client');

          if (client != null ){
            print ('El cliente no es nulo');
            Navigator.pushNamedAndRemoveUntil(context, 'client/map', (route) => false);
          }
          else {
            print ('El cliente si es nulo');
            utils.Snackbar.showSnackBar(context, key, 'El usuario no es valido');
            await _authProvider.signOut();
          }
        } else if (_typeUser == 'driver'){
          Driver driver = await _driverProvider.getById(_authProvider.getUser()!.uid);
          print ('DRIVER: $driver');
          if (driver != null ){
            Navigator.pushNamedAndRemoveUntil(context, 'driver/map', (route) => false);
          }
          else {
            utils.Snackbar.showSnackBar(context, key, 'El usuario no es valido');
            await _authProvider.signOut();
          }
        }

        utils.Snackbar.showSnackBar(context, key, 'El usuario está logeado');
      } else {
        _progressDialog.hide();
        utils.Snackbar.showSnackBar(context, key, 'No se puedo autenticar usuario');
      }
    } catch (error) {
      _progressDialog.hide();
      utils.Snackbar.showSnackBar(context, key, 'Error: $error');
    }
  }
}
