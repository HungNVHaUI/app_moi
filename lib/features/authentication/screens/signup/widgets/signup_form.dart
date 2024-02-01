import 'package:app_moi/features/authentication/controllers/signup/signup_controller.dart';
import 'package:app_moi/features/authentication/screens/signup/widgets/term_condition_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (valve) => TValidator.validateEmptyText('First name', valve),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (valve) => TValidator.validateEmptyText('Last name', valve),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          ///User Name
          TextFormField(
            controller: controller.userName,
            validator: (valve) => TValidator.validateEmptyText('User name', valve),
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.userName, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          ///Email
          TextFormField(
            controller: controller.email,
            validator: (valve) => TValidator.validateEmail(valve),
            decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          ///Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (valve) => TValidator.validatePhoneNumber(valve),
            decoration: const InputDecoration(labelText: TTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          ///Password
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
          const SizedBox(height: TSizes.spaceBtwSections),
          const TTermAndConditionCheckbox(),

          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),),
          ),
        ],
      ),
    );
  }
}

