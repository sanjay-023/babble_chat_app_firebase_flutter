import 'dart:io';

import 'package:babbleapp/app/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;

class ProfileController extends GetxController {
  File? img;
  File? cropedImg;
  String? userImageUrl;
  UserModel userModel = UserModel();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future getData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
      update();
    });
  }

  void addPhoto() async {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    img = File(pickImage!.path);
    cropImage(img!.path);

    print(img);
    update();
  }

  void cropImage(String filepath) async {
    CroppedFile? cropImage = await ImageCropper().cropImage(
        sourcePath: filepath,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (cropImage != null) {
      cropedImg = File(cropImage.path);
      print("hai$cropedImg");
      update();
      updateImage();
      update();
    }
  }

  void updateImage() async {
    final fileName = DateTime.now().millisecond.toString();
    fStorage.Reference reference = fStorage.FirebaseStorage.instance
        .ref()
        .child("userimage")
        .child(fileName);
    fStorage.UploadTask uploadTask = reference.putFile(cropedImg!);
    fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    await taskSnapshot.ref.getDownloadURL().then((url) async {
      userImageUrl = url;
    });
    update();

    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'imageurl': userImageUrl}).then((value) {
      return Fluttertoast.showToast(msg: "Profile Updated");
    });
  }
}
