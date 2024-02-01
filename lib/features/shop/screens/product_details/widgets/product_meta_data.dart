import 'package:app_moi/common/widgets/images/circular_image.dart';
import 'package:app_moi/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:app_moi/common/widgets/texts/product_price_text.dart';
import 'package:app_moi/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:app_moi/utils/constants/enums.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TProductMetaData extends StatelessWidget {
  const TProductMetaData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and Sale price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),

            /// Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems,),
            const TProductPriceText(price: '177',isLarge: true,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        /// Title
        const TProductTitleText(title: 'Kit ESP8266',),
        const SizedBox(height: TSizes.spaceBtwItems/1.5),

        /// Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status',),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/1.5),
        /// Brand
        Row(
          children: [
            TCircularImage(
              image: TImages.kitDesign,
              width: 42,
              height: 42,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const SizedBox(width: TSizes.spaceBtwItems/1.5),
            const TBrandTitleWithVerifiedIcon(title: 'Kit Design', brandTextSize: TextSizes.large,)
          ],
        )
      ],
    );
  }
}
