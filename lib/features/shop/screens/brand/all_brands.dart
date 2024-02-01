import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/common/widgets/brands/brand_card.dart';
import 'package:app_moi/common/widgets/layouts/grid_layout.dart';
import 'package:app_moi/common/widgets/products/sortable/sortable_products.dart';
import 'package:app_moi/common/widgets/texts/section_heading.dart';
import 'package:app_moi/features/shop/screens/brand/brand_products.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(title: 'Brand',showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Brand
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCard(
                        showBorder: true,
                        onTab: () => Get.to(() => const BrandProduct()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
