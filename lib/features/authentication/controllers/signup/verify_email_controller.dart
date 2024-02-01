import 'dart:async';

import 'package:app_moi/data/repositories/authentication/authentication_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/login/login.dart';


class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimeForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Send', message: 'Please check your inbox');
    }catch(e){
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }

  setTimeForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.to(() => SuccessScreen(
          image: TImages.staticSuccessIllustration  ,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()
        ),
        );
      }
    });
  }

  checkEmailVerificationStatus(){
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.to(() => SuccessScreen(
          image: TImages.staticSuccessIllustration,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()
      ),
      );
    }
  }

}