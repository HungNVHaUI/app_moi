import 'package:app_moi/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:app_moi/common/widgets/products/ratings/rating_indicator.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text("HungNV", style: Theme.of(context).textTheme.bodySmall,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text("05, Dec, 2023", style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: '  Show more',
          trimExpandedText: '  Less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        TRoundedContainer(
          backgroundColor: dark? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("AS-Store", style: Theme.of(context).textTheme.titleMedium,),
                    Text("05, Dec, 2023", style: Theme.of(context).textTheme.bodySmall,),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '  Show more',
                  trimExpandedText: '  Less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
