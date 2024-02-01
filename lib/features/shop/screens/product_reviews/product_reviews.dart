import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:app_moi/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const TAppBar(title: Text('Reviews & Ratings'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ive used the product for my trip and its perfect. The extra USB port was enough for me to charge more than 1 devices.'),
              const SizedBox(height: TSizes.spaceBtwItems,),

              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5,),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}






