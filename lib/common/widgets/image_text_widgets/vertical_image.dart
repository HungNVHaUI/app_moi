import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.texColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
  });

  final String image, title;
  final Color texColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.black : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  //color: backgroundColor ?? (dark ? TColors.light : TColors.dark),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2),

            ///Text
            SizedBox(
                width: 56,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: texColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )
            ),
          ],
        ),
      ),
    );
  }
}