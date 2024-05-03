 import 'package:flutter/material.dart';
import 'package:login_page_2/Screens/home.dart';
import 'package:login_page_2/Screens/login.dart';
import 'package:login_page_2/main.dart';
//import 'package:login_page_2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn(context);
    super.initState();
  }
 
  @override
  void didChangeDependencies() {
    //
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
          width: 200,
        ),
      ),
    );
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  Future<void> gotoLoginPage(context) async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenLogin(),
      ),
    );
  }

  Future<void> checkUserLoggedIn(context1) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    // _sharedPrefs.setBool(SAVE_KEY_NAME, true);
    final userLoggedin = sharedPrefs.getBool(saveKeyName);
    if (userLoggedin == null || userLoggedin == false) {
      gotoLoginPage(context1);
    } else {
      Navigator.of(context1).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const ScreenHome()));
    }
  }
}
