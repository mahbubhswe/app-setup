import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (controller.error.value.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        controller.error.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 40),
                  TextField(
                    onChanged: (value) => controller.email.value = value.trim(),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (value) => controller.password.value = value,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  // ✅ Login Button - reactive
                  Obx(() {
                    final isButtonEnabled =
                        controller.email.value.isNotEmpty &&
                        controller.password.value.isNotEmpty &&
                        !controller.isLoading.value;

                    return ElevatedButton(
                      onPressed:
                          isButtonEnabled
                              ? () => controller.login(
                                email: controller.email.value,
                                password: controller.password.value,
                              )
                              : null,
                      child: const Text('Login'),
                    );
                  }),
                  const SizedBox(height: 20),
                  // ✅ Google Sign-In button - reactive
                  Obx(
                    () => ElevatedButton.icon(
                      icon: const Icon(Icons.login),
                      label: const Text('Sign in with Google'),
                      onPressed:
                          controller.isLoading.value
                              ? null
                              : controller.signInWithGoogle,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ✅ Loader overlay
            if (controller.isLoading.value)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.teal,
                    size: 50,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
