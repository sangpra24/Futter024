import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/service/service.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';



class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration:const InputDecoration(
              hintText: "อีเมล",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.next,
           
              cursorColor: kPrimaryColor,
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "ชื่อผู้ใช้",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: passwordController,
              decoration:const InputDecoration(
                hintText: "รหัสผ่าน",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),

          
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if (emailController.text != "" ||
                  usernameController.text != "" ||
                  passwordController.text != "") {
                ServiceAPI.signup(usernameController.text,
                        passwordController.text, emailController.text)
                    ?.then((value) => Navigator.pop(context));
              }
            },
            child: Text("สมัครสมาชิก".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
