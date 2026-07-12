class OpportunityModel {

  final String id;
  final String startupId;
  final String startupName;
  final String title;
  final String description;
  final String category;
  final List<String> skillsRequired;
  final String duration;
  final String location;
  final String type;
  final bool isActive;


  OpportunityModel({

    required this.id,
    required this.startupId,
    required this.startupName,
    required this.title,
    required this.description,
    required this.category,
    required this.skillsRequired,
    required this.duration,
    required this.location,
    required this.type,
    required this.isActive,

  });



  factory OpportunityModel.fromMap(
      String id,
      Map<String,dynamic> data
      ){

    return OpportunityModel(

      id:id,

      startupId:
      data["startupId"] ?? "",

      startupName:
      data["startupName"] ?? "",

      title:
      data["title"] ?? "",

      description:
      data["description"] ?? "",

      category:
      data["category"] ?? "",

      skillsRequired:
      List<String>.from(
          data["skillsRequired"] ?? []
      ),

      duration:
      data["duration"] ?? "",

      location:
      data["location"] ?? "",

      type:
      data["type"] ?? "",

      isActive:
      data["isActive"] ?? true,

    );

  }



  Map<String,dynamic> toMap(){

    return {

      "startupId":startupId,

      "startupName":startupName,

      "title":title,

      "description":description,

      "category":category,

      "skillsRequired":skillsRequired,

      "duration":duration,

      "location":location,

      "type":type,

      "isActive":isActive,

      "createdAt": DateTime.now(),

    };

  }

}