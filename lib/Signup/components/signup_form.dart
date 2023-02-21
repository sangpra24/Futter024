import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/service/service.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';


//เป็นคลาสสำหรับสร้างวิดเจ็ตที่จะไม่เปลี่ยนแปลง เพราะพารามิเตอร์ เป็นkey
class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);

//สามบรรทัดนี้เป็นการสร้างออบเจกต์ สามรายการที่ชื่อ emailController, passwordController และ usernameController
//จะถูกใช้เพื่อป้อนข้อความในช่องข้อความที่เกี่ยวข้องในแอพ
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
              hintText: "Your email",
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
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "Your Username",
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
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),

          // เป็นการเช็คค่า ตรวจสอบว่าผู้ใช้ป้อนข้อความใดๆ ในช่อง emailController, usernameController, 
          // และpasswordController หรือไม่ถ้ามีก็จะเรียกใช้ signup ฟังก์ชันจากServiceAPI
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
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();//เป็นคลาสเมื่อ sign up เสร็จเเล้วผู้ใช้ไปยังหน้าใหม่ ก็คือไฟล์ LoginScreen
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
