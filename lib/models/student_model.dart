class StudentModel {

  final String uid;

  final String name;

  final String email;


  final String educationLevel;

  final String fieldOfStudy;


  final String bio;


  final List<String> skills;


  final String location;


  final String github;

  final String linkedin;


  final List<dynamic> projects;



  StudentModel({

    required this.uid,

    required this.name,

    required this.email,

    required this.educationLevel,

    required this.fieldOfStudy,

    required this.bio,

    required this.skills,

    required this.location,

    required this.github,

    required this.linkedin,

    required this.projects,

  });





  factory StudentModel.fromMap(Map<String, dynamic> data) {

    return StudentModel(

      uid: data["uid"] ?? "",

      name: data["name"] ?? "",

      email: data["email"] ?? "",


      educationLevel:
      data["educationLevel"] ?? "",


      fieldOfStudy:
      data["fieldOfStudy"] ?? "",


      bio:
      data["bio"] ?? "",



      skills:
      List<String>.from(
        data["skills"] ?? [],
      ),



      location:
      data["location"] ?? "",



      github:
      data["github"] ?? "",



      linkedin:
      data["linkedin"] ?? "",



      projects:
      data["projects"] ?? [],

    );

  }





  Map<String, dynamic> toMap() {

    return {


      "uid": uid,


      "name": name,


      "email": email,



      "educationLevel":
      educationLevel,



      "fieldOfStudy":
      fieldOfStudy,



      "bio":
      bio,



      "skills":
      skills,



      "location":
      location,



      "github":
      github,



      "linkedin":
      linkedin,



      "projects":
      projects,


    };

  }






  StudentModel copyWith({

    String? uid,

    String? name,

    String? email,


    String? educationLevel,


    String? fieldOfStudy,


    String? bio,


    List<String>? skills,


    String? location,


    String? github,


    String? linkedin,


    List<dynamic>? projects,

  }) {


    return StudentModel(


      uid:
      uid ?? this.uid,


      name:
      name ?? this.name,


      email:
      email ?? this.email,



      educationLevel:
      educationLevel ?? this.educationLevel,



      fieldOfStudy:
      fieldOfStudy ?? this.fieldOfStudy,



      bio:
      bio ?? this.bio,



      skills:
      skills ?? this.skills,



      location:
      location ?? this.location,



      github:
      github ?? this.github,



      linkedin:
      linkedin ?? this.linkedin,



      projects:
      projects ?? this.projects,


    );

  }


}