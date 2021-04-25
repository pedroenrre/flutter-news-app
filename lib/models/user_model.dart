// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class UserModel {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   User firebaseUser;
//   Map<String, dynamic> userData = Map();

//   bool isLoading = false;

//   @override
//   void addListener(VoidCallback listener) {
//     super.addListener(listener);

//     // _loadCurrentUser();
//   }

//   void signUp(
//       {@required String email,
//       @required String pass,
//       @required VoidCallback onSuccess,
//       @required VoidCallback onFail}) async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: pass);

//       // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//       // final SharedPreferences prefs = await _prefs;
//       // prefs.setBool('logged_in', true);
//       firebaseUser = userCredential.user;
//       print(userCredential);

//       onSuccess();
//       isLoading = false;
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       onFail();
//       isLoading = false;
//       notifyListeners();
//       print(e);
//     }
//   }

//   void signIn(
//       {@required String email,
//       @required String pass,
//       @required VoidCallback onSuccess,
//       @required VoidCallback onFail}) async {
//     isLoading = true;
//     notifyListeners();

//     _auth
//         .signInWithEmailAndPassword(email: email, password: pass)
//         .then((user) async {
//       firebaseUser = user.user;

//       // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//       // final SharedPreferences prefs = await _prefs;
//       // prefs.setBool('logged_in', true);

//       onSuccess();
//       isLoading = false;
//       notifyListeners();
//     }).catchError((e) {
//       onFail();
//       isLoading = false;
//       notifyListeners();
//     });
//   }

//   void signOut() async {
//     await _auth.signOut();

//     userData = Map();
//     firebaseUser = null;

//     // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//     // final SharedPreferences prefs = await _prefs;
//     // prefs.setBool('logged_in', false);

//     notifyListeners();
//   }

//   void recoverPass(String email) {
//     _auth.sendPasswordResetEmail(email: email);
//   }

//   bool isLoggedIn() {
//     return firebaseUser != null;
//   }

//   // Future<Null> _saveUserData(Map<String, dynamic> userData) async {
//   //   this.userData = userData;
//   //   await FirebaseFirestore.instance
//   //       .collection("users")
//   //       .document()
//   //       .setData(userData);
//   // }

//   // Future<Null> _loadCurrentUser() async {
//   //   if(firebaseUser == null)
//   //     firebaseUser = await _auth.currentUser();
//   //   if(firebaseUser != null){
//   //     if(userData["name"] == null){
//   //       DocumentSnapshot docUser =
//   //         await Firestore.instance.collection("users").document(firebaseUser.uid).get();
//   //       userData = docUser.data;
//   //     }
//   //   }
//   //   notifyListeners();
//   // }
// }
