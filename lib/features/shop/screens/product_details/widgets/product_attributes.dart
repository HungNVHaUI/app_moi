import 'package:app_moi/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:app_moi/common/widgets/texts/product_price_text.dart';
import 'package:app_moi/common/widgets/texts/section_heading.dart';
import 'package:app_moi/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:app_moi/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Select attributes pricing description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title, price and stock status
              Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActionButton: false,),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                  Column(
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Price: ', smallSize: true,),
                          const SizedBox(width: TSizes.spaceBtwItems,),
                          /// Actual price
                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: TSizes.spaceBtwItems,),
                          /// Sale price
                          const TProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock: ', smallSize: true,),
                          const SizedBox(width: TSizes.spaceBtwItems,),
                          /// Actual price
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const TProductTitleText(
                title: 'Description, up to 4 lines ',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Color Board', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Red', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value){},),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Chip Type', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'CH340G', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'CH9102X', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'CP2102', selected: false, onSelected: (value){},),
              ],
            )
          ],
        )

      ],
    );
  }
}


