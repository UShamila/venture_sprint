class NotificationModel {

  final String id;

  final String userId;

  final String title;

  final String message;

  final String type;

  final bool isRead;

  final DateTime createdAt;



  NotificationModel({

    required this.id,

    required this.userId,

    required this.title,

    required this.message,

    required this.type,

    required this.isRead,

    required this.createdAt,

  });



  factory NotificationModel.fromFirestore(
      String id,
      Map<String,dynamic> data,
      ){

    return NotificationModel(

      id: id,

      userId:
      data["userId"] ?? "",

      title:
      data["title"] ?? "",

      message:
      data["message"] ?? "",

      type:
      data["type"] ?? "",

      isRead:
      data["isRead"] ?? false,


      createdAt:

      data["createdAt"] != null

          ? data["createdAt"].toDate()

          : DateTime.now(),

    );

  }

}