import 'package:app_moi/features/authentication/screens/signup/verify_email.dart';
import 'package:app_moi/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:app_moi/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login/form_divider.dart';
import '../../../../common/widgets/login/social_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: TSizes.spaceBtwItems),
              ///Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}


