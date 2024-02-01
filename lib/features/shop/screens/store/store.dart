import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/common/widgets/custom_shapes/container/search_container.dart';
import 'package:app_moi/common/widgets/layouts/grid_layout.dart';
import 'package:app_moi/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:app_moi/common/widgets/texts/section_heading.dart';
import 'package:app_moi/common/widgets/brands/brand_card.dart';
import 'package:app_moi/features/shop/screens/brand/all_brands.dart';
import 'package:app_moi/features/shop/screens/store/widgets/category_tab.dart';
import 'package:app_moi/utils/constants/colors.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TCartCounterIcon(onPressed: (){},)
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled){
            return[
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children:  [
                      // Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems,),
                      const TSearchContainer(text: 'Search in Store', showBackground: false, showBorder: true, padding: EdgeInsets.zero,),
                      const SizedBox(height: TSizes.spaceBtwItems,),

                      //Feature Brands
                      TSectionHeading(title: 'Feature Brands', showActionButton: true, onPressed: () => Get.to(() => const AllBrandScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems/2,),
                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index){
                        return const TBrandCard(showBorder: false,);
                      })
                    ],
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('PLC'),),
                    Tab(child: Text('HMI'),),
                    Tab(child: Text('Inverter'),),
                    Tab(child: Text('Embedded Kit'),),
                    Tab(child: Text('Module Wifi'),),
                  ],
                ),
              )
            ];
        },
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}






