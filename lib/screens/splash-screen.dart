import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  radius: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: Image(
                      image: AssetImage('assets/splash.png'),
                      )
                  )
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text('PFE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),

            )

          ],

        ),

              ),
            );

  }
}
