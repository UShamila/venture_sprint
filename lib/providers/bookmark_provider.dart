import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/bookmark_service.dart';


class BookmarkProvider extends ChangeNotifier {


  final BookmarkService _service =
  BookmarkService();



  Set<String> bookmarked =
  {};



  void loadBookmarks(
      String studentId
      ){


    _service
        .getBookmarks(studentId)
        .listen((snapshot){


      bookmarked = snapshot.docs
          .map(
              (doc)=>
              doc["opportunityId"].toString()
      )
          .toSet();



      notifyListeners();


    });


  }




  Future<void> toggleBookmark(
      String studentId,
      String opportunityId,
      ) async {



    if(bookmarked.contains(opportunityId)){


      bookmarked.remove(opportunityId);


    }

    else{


      await _service.addBookmark(
        studentId,
        opportunityId,
      );


    }



    notifyListeners();


  }



  bool isBookmarked(
      String opportunityId
      ){


    return bookmarked.contains(opportunityId);


  }



}