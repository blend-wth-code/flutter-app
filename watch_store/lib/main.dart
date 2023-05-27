import 'package:flutter/material.dart';
import '../widget/Checkout.dart';
import '../widget/Details.dart';
import '../widget/Products.dart';
import '../widget/Login.dart';
import 'widget/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luxury',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of application.
        primarySwatch: const MaterialColor(
          0xFF000000,
          {
            50: Colors.black54,
            100: Colors.black87,
            200: Colors.black,
            300: Colors.black,
            400: Colors.black,
            500: Colors.black,
            600: Colors.black,
            700: Colors.black,
            800: Colors.black,
            900: Colors.black,
          },
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: "Watch Store"),
        "/register": (context) => const Register(),
        "/login": (context) => const Login(),
        "/product": (context) => const Products(),
        "/details": (context) =>
            Details(id: ModalRoute.of(context)?.settings.arguments as int),
        "/checkout": (context) => const Checkout(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).popAndPushNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              child: Image(
                height: 300,
                width: 300,
                image: AssetImage("images/logo.jpeg"),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
