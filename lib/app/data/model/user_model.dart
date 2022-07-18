class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? uid;
  String? imageurl;
  String? phone;

  UserModel(
      {this.firstName, this.lastName, this.uid, this.email, this.imageurl});

  //receiving data from firestore
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map["uid"],
        firstName: map["firstname"],
        lastName: map["lastname"],
        email: map["email"],
        imageurl: map["imageurl"]);
  }

  // sending data to firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'imageurl': imageurl
    };
  }
}
