import 'package:app_moi/features/authentication/screens/login/widgets/login_form.dart';
import 'package:app_moi/features/authentication/screens/login/widgets/login_header.dart';
import 'package:app_moi/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login/form_divider.dart';
import '../../../../common/widgets/login/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo & Title App
              const TLoginHeader(),

              ///Form Login
              const TLoginForm(),

              ///Divider
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







