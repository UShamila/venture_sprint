import 'package:cloud_firestore/cloud_firestore.dart';


class BookmarkService {


  final FirebaseFirestore _db =
      FirebaseFirestore.instance;



  Future<void> addBookmark(
      String studentId,
      String opportunityId,
      ) async {


    await _db
        .collection("bookmarks")
        .add({

      "studentId":
      studentId,


      "opportunityId":
      opportunityId,


      "createdAt":
      Timestamp.now(),


    });


  }





  Future<void> removeBookmark(
      String bookmarkId,
      ) async {


    await _db
        .collection("bookmarks")
        .doc(bookmarkId)
        .delete();


  }





  Stream<QuerySnapshot> getBookmarks(
      String studentId
      ){


    return _db
        .collection("bookmarks")

        .where(
        "studentId",
        isEqualTo: studentId
    )

        .snapshots();


  }



}