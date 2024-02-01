import 'package:app_moi/common/widgets/texts/section_heading.dart';
import 'package:app_moi/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:app_moi/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:app_moi/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:app_moi/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:app_moi/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../product_reviews/product_reviews.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating and Share button
                  const TRatingAndShare(),
                  /// Price, title, Stock & Brand
                  const TProductMetaData(),
                  /// Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text('Check out'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  /// Description
                  const TSectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  const ReadMoreText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada, turpis non venenatis mollis, nulla lacus consequat odio,',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '  Show more',
                    trimExpandedText: '  Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),


                  /// Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Review(199)', showActionButton: false,),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18, ), onPressed: () => Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}




