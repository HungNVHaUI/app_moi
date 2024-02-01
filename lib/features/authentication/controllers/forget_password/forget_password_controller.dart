

import 'package:app_moi/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:app_moi/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repositories.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try{
      TFullScreenLoader.openLoadingDialog('Processing your request....', TImages.loading);
      /// Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      /// Google Authentication
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link sent to Reset your Password'.tr);
      
      Get.to(() => ResetPassword(email: email.text.trim()));

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }


  resendPasswordResetEmail(String email) async {
    try{
      TFullScreenLoader.openLoadingDialog('Processing your request....', TImages.loading);
      /// Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      /// Google Authentication
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link sent to Reset your Password'.tr);

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }

}