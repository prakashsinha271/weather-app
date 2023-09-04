import 'package:flutter/material.dart';
import '../constants/strings.dart';
import '../helper/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    if (await checkInternetConnectivity(context)) {
      fetchDataAndNavigate(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.tealAccent.shade100, Colors.teal.shade600],
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                appTitleText,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  shadows: [
                    Shadow(
                      blurRadius: 1.0,
                      color: Colors.red,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 75),
              SpinKitDoubleBounce(
                color: Colors.blue,
                size: 80.0,
              ),
              SizedBox(height: 20),
              Text(loadingText,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        blurRadius: 1.0,
                        color: Colors.orange,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  )),
              SizedBox(height: 24),
              Text(
                developByText,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  shadows: [
                    Shadow(
                      blurRadius: 1.0,
                      color: Colors.redAccent,
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(devName,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        blurRadius: 1.0,
                        color: Colors.orange,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
