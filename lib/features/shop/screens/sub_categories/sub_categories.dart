import 'package:app_moi/common/widgets/images/rounded_image.dart';
import 'package:app_moi/common/widgets/texts/section_heading.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';


class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Kit Design', style: Theme.of(context).textTheme.headlineSmall),),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
            const TRoundedImage(imageUrl: TImages.promoBanner4, width: double.infinity, applyImageRadius: true,),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sub-Categories
            Column(
              children: [
                TSectionHeading(title: 'Relay Kit', onPressed: (){},),
                const SizedBox(height: TSizes.spaceBtwItems/2),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index) =>  const TProductHorizontal(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}