import 'package:app_moi/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/sinup.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (valve) => TValidator.validateEmail(valve),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                validator: (valve) => TValidator.validatePassword(valve),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                    )
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            ///Remember Me & ForgetPassword
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember Me
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                ///ForgetPassword
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),

            ///SignIn Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()  => controller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            ///Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TTexts.createAccount),),
            ),
          ],
        ),
      ),
    );
  }
}