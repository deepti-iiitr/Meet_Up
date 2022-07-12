import 'package:flutter/material.dart';
import 'package:meet_up/controllers/auth_controller.dart';
import 'package:meet_up/views/screens/home_screen.dart';
import 'package:meet_up/views/screens/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authcontroller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start or join a meeting',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/onboarding.jpg',
          ),
          CustomButton(
            text: 'Login',
            onPressed: () {
              _authcontroller.signInWithGoogle();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return HomeScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
