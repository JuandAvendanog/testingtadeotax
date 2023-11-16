import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:tadeotax_android/src/utils/my_progress_dialog.dart';
import 'package:tadeotax_android/src/models/cliente.dart';
import 'package:tadeotax_android/src/providers/auth_provider.dart';
import 'package:tadeotax_android/src/providers/client_provider.dart';
import 'package:tadeotax_android/src/utils/snackbar.dart' as utils;

class ClientRegisterController {
  late BuildContext context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  ProgressDialog? _progressDialog;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late AuthProvider _authProvider;
  late ClientProvider _clientProvider;

  void init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _clientProvider = ClientProvider();
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
    if (password.length < 7) {
      utils.Snackbar.showSnackBar(
          context, key, 'La contraseña debe ser igual o mayor a 8 carácteres');
      return;
    }

    _progressDialog!.show();

    try {
      bool isRegister = await _authProvider.register(email, password);
      if (isRegister) {
        Client client = Client(
          id: _authProvider.getUser()?.uid ?? '',
          email: email,
          userName: userName,
          password: password,
          phone: phone,
        );

        await _clientProvider.create(client);
        _progressDialog!.hide();
        Navigator.pushNamedAndRemoveUntil(context, 'client/map', (route) => false);


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
