import 'package:flutter/material.dart';
import 'package:login_page_2/Screens/home.dart';
import 'package:login_page_2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //bool _isDataMatched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('LOGIN PAGE ')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(
                    top: 210,
                  )),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(34),
                        ),
                        hintText: 'Username '),
                    validator: (value) => value == null || value.isEmpty
                        ? 'UserName is Empty'
                        : null,
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  const Padding(
                      padding: EdgeInsets.only(
                    top: 20,
                  )),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(34),
                        ),
                        hintText: 'Password'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Password is Empty'
                        : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //--------------------------------
                  ElevatedButton.icon(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                      checkLogin(context);
                    },
                    label: const Text(
                      'Login ',
                    ),
                    icon: const Icon(Icons.check),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(ctx) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == 'devan' && password == '2018') {
      //Gotohom
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(saveKeyName, true);
      correct(ctx);
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => const ScreenHome(),
        ),
      );
    } else {
      if (username.isNotEmpty) {
        incorrect(ctx);
      }
    }
  }

  void correct(ctx) {
    const correctMessage = 'Username password matched';
    //snack bar
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 16, 195, 13),
        margin: EdgeInsets.all(10),
        content: Text(correctMessage),
      ),
    );
  }

  void incorrect(ctx1) {
    const correctMessage = 'Username  password not matched';
    //snack bar
    ScaffoldMessenger.of(ctx1).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 195, 13, 13),
        margin: EdgeInsets.all(10),
        content: Text(correctMessage),
      ),
    );
  }
}
