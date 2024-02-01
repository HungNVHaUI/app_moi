import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../sub_categories/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          return TVerticalImageText(
            image: TImages.plcLogo,
            title: "PLC Categories",
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}