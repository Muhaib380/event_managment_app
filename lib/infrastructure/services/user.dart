import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class UserServices {
  String userCollection = "UserCollection";

  /// create user
  Future createUser(UserModel model) async {
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(model.docId)
        .set(model.toJson());
  }

  ///  update user
  Future updateUser(UserModel model) async {
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(model.docId)
        .update({
          "userName": model.userName,
          "profileImage": model.profileImage,
        });
  }

  /// Save profile image URL
  Future saveProfileImageUrl(String userId, String imageUrl) async {
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(userId)
        .update({"profileImage": imageUrl});
  }

  /// get user profile
  Future<UserModel> getUserProfile(String userId) async {
    final val = await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(userId)
        .get();

    // ✅ Pehle check karo document exist karta hai ya nahi
    if (!val.exists || val.data() == null) {
      // ✅ Empty model return karo — crash nahi hoga
      return UserModel(docId: userId);
    }

    return UserModel.fromJson(
      val.data()!,
      docId: val.id,
    ); // ✅ docId bhi pass karo
  }

  /// merge data
  Future mergeData(UserModel model) async {
    return FirebaseFirestore.instance
        .collection(userCollection)
        .doc(model.docId)
        .set(model.toJson(), SetOptions(merge: true));
  }
}
