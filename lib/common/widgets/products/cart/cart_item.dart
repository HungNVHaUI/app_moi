import 'package:flutter/material.dart';

import '../../../../features/shop/screens/product_details/widgets/product_title_text.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding:  const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Title price & type
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Kit'),
              const Flexible(child: TProductTitleText(title: 'Relay Kit', maxLines: 1)),
              Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Color Board  ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green  ', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Type  ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '04 Channel', style: Theme.of(context).textTheme.bodyLarge),
                    ]
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}