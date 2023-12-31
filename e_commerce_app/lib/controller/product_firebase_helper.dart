import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/controller/firebase_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductFirebaseHelper {
  final cloudStorage = FirebaseStorage.instance;
  final fireStore = FirebaseFirestore.instance;

  Future getImageUrl(String imageId) async {
    return await cloudStorage.ref("/home/$imageId.png").getDownloadURL();
  }

  Future addToFavourtes(String productID, Map<String, dynamic> product) async {
    return await fireStore
        .collection("favourite")
        .doc("/${FirebaseHelper().auth.currentUser!.uid + productID}")
        .set(product);
  }

  Future getFavourtes() async {
    await fireStore.collection("favourite").get().then((value) => value.docs);
  }
}
