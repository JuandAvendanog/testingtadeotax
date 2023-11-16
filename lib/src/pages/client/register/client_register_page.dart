import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tadeotax_android/src/pages/client/register/client_register_controller.dart';
import '../../../widgest/button_app.dart';

class ClientRegisterPage extends StatefulWidget {
  const ClientRegisterPage({Key? key}) : super(key: key);

  @override
  State<ClientRegisterPage> createState() => _ClientRegisterPageState();
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {
  final ClientRegisterController _controller = ClientRegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.key,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(0.2 * 130), // 20% del ancho
                      child: Image.asset(
                        'assets/img/tadeotax1.png',
                        width: 140,
                        height: 140,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'REGISTER STUDENT',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(20), // Espaciado interior
                  child: Column(
                    children: [
                      //email
                      TextField(
                        controller: _controller.userNameController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person_outline_rounded),
                          hintText: 'User Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black  ),
                      ),
                      const SizedBox(height: 15),
                      // Email
                      TextField(
                        controller: _controller.emailController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.alternate_email_rounded),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 15),
                      // Phone
                      TextField(
                        controller: _controller.phoneController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.phone_android_rounded),
                          hintText: 'Phone',
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 15),
                      // password
                      TextField(
                        controller: _controller.passwordController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.password_rounded),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      // Confirm password
                      TextField(
                        controller: _controller.confirmPasswordController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.password_rounded),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      // Button Register
                      CustomButton(
                        text: 'REGISTER',
                        color: Colors.black,
                        radius: 50,
                        fontSize: 20,
                        icon: Icons.arrow_forward_ios,
                        onPressed: () {
                          _controller.register();
                        }, //_controller.login
                      ),
                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () {
                          _controller.goToLoginPage();
                        },
                        child: const Text(
                          'Already have an Account? ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
