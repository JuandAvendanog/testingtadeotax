import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tadeotax_android/src/pages/login/login_controller.dart';
import '../../widgest/button_app.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController _controller = loginController();
  @override
  void initState() {
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/background.png'),
              fit: BoxFit.cover,
            ),
          ),
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
                          'assets/img/tnegro.png',
                          width: 130,
                          height: 128,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'TADEOTAX',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.6), // Color negro con 60% de opacidad
                      borderRadius: BorderRadius.circular(20), // Radio del 20%
                    ),
                    padding: const EdgeInsets.all(20), // Espaciado interior
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Welcome to TADEOTAX',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff918592),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        //email
                        TextField(
                          controller: _controller.emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 25),
                        // password
                        TextField(
                          controller: _controller.passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                        ),
                        const SizedBox(height: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                                child: CustomButton(
                                  text: 'LOGIN',
                                  color: Colors.black,
                                  radius: 50,
                                  fontSize: 20,
                                  icon: Icons.arrow_forward_ios,
                                  onPressed: (){
                                    _controller.login();
                                  }, //_controller.login
                                ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _controller.goToRegisterPage();
                                  },
                                  child: const Text(
                                    'Don’t have an account? Sign up',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
