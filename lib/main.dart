import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tadeotax_android/firebase_options.dart';
import 'package:tadeotax_android/src/pages/client/map/client_map_page.dart';
import 'package:tadeotax_android/src/pages/driver/map/driver_map_page.dart';
import 'package:tadeotax_android/src/pages/driver/register/driver_register_page.dart';
import 'package:tadeotax_android/src/pages/home/home_page.dart';
import 'package:tadeotax_android/src/pages/login/login_page.dart';
import 'package:tadeotax_android/src/pages/client/register/client_register_page.dart';
import 'package:tadeotax_android/src/pages/user/history/user_history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TadeoTax',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => const LoginPage(),
        'client/register': (BuildContext context) => const ClientRegisterPage(),
        'driver/register': (BuildContext context) => const DriverRegisterPage(),
        'client/map': (BuildContext context) => const ClientMapPage(),
        'driver/map': (BuildContext context) => const DriverMapPage(),
        'history': (BuildContext context) => const UserHistoryPage(),
      },
    );
  }
}
