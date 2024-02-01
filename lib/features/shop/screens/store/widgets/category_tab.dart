import 'package:app_moi/common/widgets/layouts/grid_layout.dart';
import 'package:app_moi/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_moi/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';


class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowcase(image: [TImages.productImage1,TImages.productImage2,TImages.productImage3],),
              const SizedBox(height: TSizes.spaceBtwItems ,),
              TSectionHeading(title: 'You might like', showActionButton: true, onPressed: (){},),
              const SizedBox(height: TSizes.spaceBtwItems ,),
              TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductVertical()),
              const SizedBox(height: TSizes.spaceBtwItems ,),

            ],
          ),
        ),
      ],
    );
  }
}
