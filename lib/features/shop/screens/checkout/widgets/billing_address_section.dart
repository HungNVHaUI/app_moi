import 'package:app_moi/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
        Text('Automation Supply', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey,size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems/2),
            Text('+84979553398', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey,size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems/2),
            Text('Vinh Thinh, Vinh Loc, Thanh Hoa', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,),
          ],
        ),
      ],
    );
  }
}
