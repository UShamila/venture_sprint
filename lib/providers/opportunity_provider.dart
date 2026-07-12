import 'package:flutter/material.dart';

import '../models/opportunity_model.dart';
import '../services/opportunity_service.dart';



class OpportunityProvider extends ChangeNotifier {


  final OpportunityService _service =
  OpportunityService();



  List<OpportunityModel> opportunities = [];

  List<OpportunityModel> filteredOpportunities = [];

  List<OpportunityModel> recommend(
      List<String> skills,
      ) {
    return opportunities.where((opportunity) {

      return opportunity.skillsRequired.any(
            (skill) => skills.contains(skill),
      );

    }).toList();
  }


  bool loading = false;



  void loadOpportunities(){


    loading = true;

    notifyListeners();



    _service.getOpportunities()
        .listen((snapshot){



      opportunities =
          snapshot.docs.map((doc){


            return OpportunityModel.fromMap(

                doc.id,

                doc.data()
                as Map<String,dynamic>

            );


          }).toList();



      filteredOpportunities =
          opportunities;



      loading=false;

      notifyListeners();


    });


  }





  Future<void> addOpportunity(
      Map<String,dynamic> data

      ) async{


    await _service.createOpportunity(
        data
    );


  }





  void searchOpportunity(
      String query
      ){


    if(query.isEmpty){


      filteredOpportunities =
          opportunities;


    }

    else{


      filteredOpportunities =
          opportunities.where((item){


            return item.title
                .toLowerCase()
                .contains(
                query.toLowerCase()
            )

                ||

                item.startupName
                    .toLowerCase()
                    .contains(
                    query.toLowerCase()
                )

                ||

                item.category
                    .toLowerCase()
                    .contains(
                    query.toLowerCase()
                );



          }).toList();



    }


    notifyListeners();


  }


  void filterByCategory(
      String category
      ){



    filteredOpportunities =
        opportunities.where((item){


          return item.category
              .toLowerCase()
              ==
              category.toLowerCase();


        }).toList();

    notifyListeners();

  }

}