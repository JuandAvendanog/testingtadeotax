import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tadeotax_android/src/utils/my_progress_dialog.dart';
import 'package:tadeotax_android/src/models/driver.dart';
import 'package:tadeotax_android/src/providers/auth_provider.dart';
import 'package:tadeotax_android/src/utils/snackbar.dart' as utils;

import '../../../providers/driver_provider.dart';

class DriverRegisterController {
  late BuildContext context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  ProgressDialog? _progressDialog;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();


  late AuthProvider _authProvider;
  late DriverProvider _driverProvider;

  void init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _driverProvider = DriverProvider();
    _progressDialog =
        MyProgressDialog.createProgressDialog(context, "Espere un momento...");
  }

  void goToLoginPage() {
    Navigator.pushNamed(context, 'login');
  }

  void register() async {
    String userName = userNameController.text;
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    String pin1 = pin1Controller.text.trim();
    String pin2 = pin2Controller.text.trim();
    String pin3 = pin3Controller.text.trim();
    String pin4 = pin4Controller.text.trim();
    String pin5 = pin5Controller.text.trim();
    String pin6 = pin6Controller.text.trim();

    String plate = '$pin1$pin2$pin3 - $pin4$pin5$pin6';

    // Validar si esta vacios
    if (userName.isEmpty &&
        email.isEmpty &&
        phone.isEmpty &&
        password.isEmpty &&
        confirmPassword.isEmpty) {
      utils.Snackbar.showSnackBar(
          context, key, 'Debes ingresar todos los campos');
      return;
    }
    // Valida si las contraseñas son iguales
    if (confirmPassword != password) {
      utils.Snackbar.showSnackBar(context, key, 'Las contraseñas no coinciden');
      return;
    }
    // contraseña menos a 8 Caracteres
    if (password.length <= 7) {
      utils.Snackbar.showSnackBar(
          context, key, 'La contraseña debe ser igual o mayor a 8 carácteres');
      return;
    }

    _progressDialog!.show();

    try {
      bool isRegister = await _authProvider.register(email, password);
      if (isRegister) {
        Driver driver = Driver(
          id: _authProvider.getUser()?.uid ?? '',
          email: email,
          userName: userName,
          password: password,
          phone: phone,
          plate: plate,
        );

        await _driverProvider.create(driver);
        _progressDialog!.hide();
        Navigator.pushNamedAndRemoveUntil(context, 'driver/map', (route) => false);


        utils.Snackbar.showSnackBar(
            context, key, 'El usuario se registro correctamente');
      } else {
        _progressDialog!.hide();
        utils.Snackbar.showSnackBar(
            context, key, 'No se pudo registrar el usuario');
      }
    } catch (error) {
      _progressDialog!.hide();
      utils.Snackbar.showSnackBar(context, key, 'Error: $error');
    }
  }
}
