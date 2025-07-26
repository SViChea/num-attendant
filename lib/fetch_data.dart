// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:num_attendant/login_screen.dart';

// class CloudFirestoreHelper {
//   var db = FirebaseFirestore.instance;
//   final AuthHelper authHelper = AuthHelper();


//   Future<Map<String, dynamic>> getOneDocument() async {
//     Map<String, dynamic> user = {};
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await db.collection('student_information').doc("AUvoxdLCa9bf0JtA5dGnaBu1BBS2").get();
//       user = snapshot.data()!;
//       return user;
//     } catch (e) {
//       print("Error loading user data: $e");
//       return {};
//     }
//   }
// }