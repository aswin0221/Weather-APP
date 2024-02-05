import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  redirectToHome(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [Text("Loding.."), CircularProgressIndicator()],
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network(
                "https://lottie.host/b6e9f31a-2e15-46cb-abb6-e2dc518e5a1a/nLRYhdVhgo.json"),
            Text(
              "Weather Reporter...",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            )
          ],
        ),
      ),
      backgroundColor: Colors.teal[100],
    );
  }
}
