import 'package:flutter/material.dart';
import 'package:notesearch/widgets/LoginScreen/loginCart.dart';
import 'package:notesearch/widgets/LoginScreen/singUpCart.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login & Signup'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Signup'),
            ],
          ),
        ),
        body: Center(
          child: Container(
            width: 1000,
            child: TabBarView(
              children: [
                Login(),
                Signup(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
