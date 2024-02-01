import 'package:app_moi/data/model/user_model.dart';
import 'package:app_moi/data/repositories/user/user_repositories.dart';
import 'package:app_moi/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // Map data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') :  '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
        );
        // Save data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not save',
          message: 'Something went wrong while saving your information');
    }
  }
}
