import 'package:flutter/material.dart';
import 'package:genuine_task/feature/auth/presentation/controller/auth_controller.dart';
import 'package:genuine_task/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController controller = Get.find();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to Genuine",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Email")
              ),
              SizedBox(height: 5),
              BoxTextField(
                controller: emailC, 
                hintText: "admin@gmail.com"
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Password")
              ),
              SizedBox(height: 5),
              BoxTextField(
                controller: passC, 
                hintText: "admin1234",
                obscureText: true,
              ),
              SizedBox(height: 20),
              Obx(
                () => GestureDetector(
                  onTap: controller.isLoading.value
                      ? null
                      : () {
                          controller.login(
                            emailC.text.trim(),
                            passC.text.trim(),
                            1,
                          );
                        },
                  child: Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.green,
                        Colors.lightGreen
                      ],),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: controller.isLoading.value
                        ? Center(child: CircularProgressIndicator(color: Colors.white))
                        : Center(child: Text('Login',style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}