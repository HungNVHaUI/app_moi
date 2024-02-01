import 'package:app_moi/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:app_moi/features/authentication/screens/login/login.dart';
import 'package:app_moi/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:app_moi/utils/constants/text_strings.dart';
import 'package:app_moi/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({ super.key, required this.email });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()),  icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              //Image(image: const AssetImage(TImages.deliveredEmailIllustration), width: THelperFunctions.screenWidth() * 0.6,),
              Lottie.asset(TImages.deliveredEmailIllustration, width: MediaQuery.of(context).size.width * 0.8),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// Title & Sub-title
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              ///Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(TTexts.tDone)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextButton(
                onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                child: const Text(TTexts.resendEmail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
