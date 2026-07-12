class StartupModel {


  final String uid;

  final String name;

  final String email;

  final String startupName;

  final String description;

  final String industry;

  final String location;

  final String website;

  final String contactEmail;

  final String verificationStatus;

  final bool isVerified;




  StartupModel({


    required this.uid,

    required this.name,

    required this.email,

    required this.startupName,

    required this.description,

    required this.industry,

    required this.location,

    required this.website,

    required this.contactEmail,

    required this.verificationStatus,

    required this.isVerified,


  });





  factory StartupModel.fromMap(
      Map<String, dynamic> map
      ) {


    return StartupModel(


      uid:
      map["uid"] ?? "",



      name:
      map["name"] ?? "",



      email:
      map["email"] ?? "",



      startupName:
      map["startupName"] ?? "",



      description:
      map["description"] ?? "",



      industry:
      map["industry"] ?? "",



      location:
      map["location"] ?? "",



      website:
      map["website"] ?? "",



      contactEmail:
      map["contactEmail"] ?? "",



      verificationStatus:
      map["verificationStatus"] ?? "pending",



      isVerified:
      map["isVerified"] ?? false,


    );


  }





  Map<String, dynamic> toMap() {


    return {


      "uid":
      uid,


      "name":
      name,


      "email":
      email,


      "startupName":
      startupName,


      "description":
      description,


      "industry":
      industry,


      "location":
      location,


      "website":
      website,


      "contactEmail":
      contactEmail,


      "verificationStatus":
      verificationStatus,


      "isVerified":
      isVerified,


    };


  }


}