import 'package:app_moi/common/widgets/layouts/grid_layout.dart';
import 'package:app_moi/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:app_moi/features/shop/screens/home/widgets/home_categories.dart';
import 'package:app_moi/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/container/header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             THeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSearchContainer(
                    text: 'Search in Store',
                    showBorder: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///Heading
                        TSectionHeading(
                          title: "Popular Categories",
                          showActionButton: true,
                          textColor: Colors.white,
                          onPressed: () => Get.to(() => const AllProducts()),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        ///Categories
                        const THomeCategories(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(banner: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3,
                    TImages.promoBanner4
                  ],),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductVertical()),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}


