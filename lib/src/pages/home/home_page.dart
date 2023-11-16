import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tadeotax_android/src/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _con = HomeController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context); // Instancia home controller
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/img/tadeotax1.png',
                  width: 130,
                  height: 128,
                ),
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
                    color: Color(0xffC13CC1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text("Enter how?", style: TextStyle(fontSize: 30)),
            const SizedBox(height: 50),
            _imageTypeUser(context, 'assets/img/student.png', 'client'),
            const SizedBox(height: 15),
            _textTypeUser('Student'),
            const SizedBox(height: 50),
            _imageTypeUser(context, 'assets/img/driver.png', 'driver'),
            const SizedBox(height: 15),
            _textTypeUser('Driver')
          ],
        ),
      ),
    );
  }

  Widget _imageTypeUser(BuildContext context, image, String typeUser) {
    return GestureDetector(
      onTap: () => _con.goToLoginPage(typeUser),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 55,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget _textTypeUser(String typeUser) {
    return Text(
      typeUser,
      style: const TextStyle(fontSize: 25),
    );
  }
}
