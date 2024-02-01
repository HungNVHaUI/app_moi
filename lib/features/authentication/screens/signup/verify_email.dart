import 'package:app_moi/common/widgets/success_screen/success_screen.dart';
import 'package:app_moi/data/repositories/authentication/authentication_repositories.dart';
import 'package:app_moi/features/authentication/screens/login/login.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:app_moi/utils/constants/text_strings.dart';
import 'package:app_moi/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/signup/verify_email_controller.dart';


class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(),  icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Image(image: const AssetImage(TImages.deliveredEmailIllustration), width: THelperFunctions.screenWidth() * 0.6,),
              Lottie.asset(TImages.deliveredEmailIllustration, width: MediaQuery.of(context).size.width * 0.8),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// Title & Sub-title
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Button
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () => controller.checkEmailVerificationStatus(),
              //     child: const Text(TTexts.tContinue)),
              // ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: const Text(TTexts.resendEmail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
