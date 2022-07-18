import 'package:babbleapp/app/data/function/helper_functions.dart';
import 'package:babbleapp/app/data/model/user_model.dart';
import 'package:babbleapp/app/modules/authentication/views/authentication_view.dart';
import 'package:babbleapp/app/modules/home/views/home_view.dart';
import 'package:babbleapp/app/modules/signup/controllers/signup_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final signupController = Get.put(SignupController());

class AuthService extends GetxController {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool? signedUp;
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUserData;
  UserModel userModel(User? user) {
    return UserModel(uid: user!.uid);
  }

  Future logInWithEmail(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user!;

      userModel(firebaseUser);

      Get.off((HomeView()));
    } catch (e) {
      signupController.showErrorSnack(e.toString());
    }
  }

  Stream<UserModel> get userData {
    return auth.authStateChanges().map(userModel);
  }

  Future signUpwithemail(String email, String password) async {
    try {
      UserCredential result = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          // .then((value) => postDataToFirebase())
          .catchError((e) {
        signupController.showErrorSnack(e.message);
      });

      User firebaseUser = result.user!;

      userModel(firebaseUser);
      postDataToFirebase();
      HelperFunction.saveUserName(fNameController.text);
      HelperFunction.saveUserEmail(emailController.text);

      Get.offAll(HomeView());

      update();
    } catch (e) {
      //signupController.showErrorSnack(e.toString());
      return;
    }
  }

  Future resetPassword(String email) async {
    try {
      return await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    await auth.signOut();
    Get.offAll(AuthenticationView());
  }

  Future googleSignUp() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    } else {
      googleUserData = googleUser;
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    update();
  }

  postDataToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = fNameController.text;
    userModel.lastName = lNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }

  void clearSharedprfns() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
