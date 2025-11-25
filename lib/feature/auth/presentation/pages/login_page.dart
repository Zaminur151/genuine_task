import 'package:flutter/material.dart';
import 'package:genuine_task/feature/auth/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController controller = Get.find();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Email")),
            //SizedBox(height: 10,),
            TextField(
              controller: emailC,
              decoration: InputDecoration(hintText: 'admin@gmail.com'),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Password")),
            //SizedBox(height: 10,),
            TextField(
              controller: passC,
              decoration: InputDecoration(hintText: 'admin1234'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(
              () => ElevatedButton(
                child: controller.isLoading.value
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Login'),
                onPressed: controller.isLoading.value
                    ? null
                    : () {
                        controller.login(
                          emailC.text.trim(),
                          passC.text.trim(),
                          1,
                        );
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}