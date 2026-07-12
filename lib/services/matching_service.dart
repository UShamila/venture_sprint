class MatchingService {


  double calculateMatch(
      List studentSkills,
      List requiredSkills
      ){


    if(requiredSkills.isEmpty){

      return 0;

    }


    int matches = 0;



    for(var skill in requiredSkills){

      if(
      studentSkills
          .map((e)=>e.toString().toLowerCase())
          .contains(
          skill.toString().toLowerCase()
      )
      ){

        matches++;

      }

    }



    return
      (matches / requiredSkills.length) * 100;


  }


}