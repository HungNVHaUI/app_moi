import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';


class TTermAndConditionCheckbox extends StatelessWidget {
  const TTermAndConditionCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    const sizeFactor = 0.88;
    return Row(
      children: [
        SizedBox(
            width: 20 * sizeFactor,
            height: 20 * sizeFactor,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (valve) => controller.privacyPolicy.value =! controller.privacyPolicy.value)
            )
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall!.apply(fontSizeFactor: sizeFactor)),
                TextSpan(text: TTexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary,
                  fontSizeFactor: sizeFactor,
                ),),
                TextSpan(text: '${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall!.apply(fontSizeFactor: sizeFactor)),
                TextSpan(text: TTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary,
                  fontSizeFactor: sizeFactor,
                ),),
              ],
            )),
      ],
    );
  }
}