import 'package:app_moi/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:app_moi/common/widgets/images/rounded_image.dart';
import 'package:app_moi/utils/constants/colors.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:app_moi/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icon.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';


class TProductHorizontal extends StatelessWidget {
  const TProductHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true,)
                ),
                /// Sale Tag
                Positioned(
                  top: 4,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),
                ///Favourite icon button
                const Positioned(
                    top:-12,
                    right: -12,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
          /// Detail
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const SizedBox(
                    width: 172,
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitle(title: '8 Chanel Relay Kit ',smallSize: true,),
                        SizedBox(height: TSizes.spaceBtwItems/2),
                        TBrandTitleWithVerifiedIcon(title: 'Kit',),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: TProductPriceText(price: '256',)),
                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),

                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: TColors.white,))
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






