import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  final FirebaseAuth _auth =
      FirebaseAuth.instance;

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;


  User? get currentUser {

    return _auth.currentUser;

  }


  Future<User?> register({

    required String email,

    required String password,

    required String name,

    required String role,

  }) async {

    UserCredential result =
    await _auth.createUserWithEmailAndPassword(

      email: email,

      password: password,

    );

    User? user = result.user;

    if (user != null) {

      await _firestore
          .collection("users")
          .doc(user.uid)
          .set({

        "uid": user.uid,

        "name": name,

        "email": email,

        "role": role,

        "verificationStatus":
        role == "startup"
            ? "pending"
            : "approved",

        "createdAt": Timestamp.now(),

      });

    }

    return user;

  }


  Future<User?> login(
      String email,
      String password,
      ) async {

    try {

      UserCredential result =
      await _auth.signInWithEmailAndPassword(

        email: email,

        password: password,

      );

      return result.user;

    } on FirebaseAuthException catch (e) {

      if (e.code == "user-not-found") {

        throw Exception("No account found with this email.");

      }

      if (e.code == "wrong-password") {

        throw Exception("Incorrect password.");

      }

      if (e.code == "invalid-credential") {

        throw Exception("Incorrect email or password.");

      }

      if (e.code == "invalid-email") {

        throw Exception("Please enter a valid email.");

      }

      throw Exception(e.message ?? "Login failed.");

    }

  }


  Future<void> resetPassword(

      String email,

      ) async {

    await _auth.sendPasswordResetEmail(

      email: email,

    );

  }


  Future<void> logout() async {

    await FirebaseAuth.instance.signOut();

  }


  Future<String?> getUserRole() async {

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) return null;


    DocumentSnapshot document =
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();


    if (!document.exists) return null;


    return document["role"];

  }

}