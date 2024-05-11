// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    String? sts;
    String? msg;
    int? postCount;
    List<Media>? media;

    ResponseModel({
        this.sts,
        this.msg,
        this.postCount,
        this.media,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        sts: json["sts"],
        msg: json["msg"],
        postCount: json["postCount"],
        media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "postCount": postCount,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
    };
}

class Media {
    String? id;
    UserId? userId;
    FileType? fileType;
    String? fileName;
    String? filePath;
    String? description;
    List<String>? likedBy;
    int? likeCount;
    List<String>? commentId;
    int? commentCount;
    bool? story;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    FirstName? firstName;
    LastName? lastName;
    String? profilePic;

    Media({
        this.id,
        this.userId,
        this.fileType,
        this.fileName,
        this.filePath,
        this.description,
        this.likedBy,
        this.likeCount,
        this.commentId,
        this.commentCount,
        this.story,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.firstName,
        this.lastName,
        this.profilePic,
    });

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["_id"],
        userId: userIdValues.map[json["userId"]]!,
        fileType: fileTypeValues.map[json["fileType"]]!,
        fileName: json["fileName"],
        filePath: json["filePath"],
        description: json["description"],
        likedBy: json["likedBy"] == null ? [] : List<String>.from(json["likedBy"]!.map((x) => x)),
        likeCount: json["likeCount"],
        commentId: json["commentId"] == null ? [] : List<String>.from(json["commentId"]!.map((x) => x)),
        commentCount: json["commentCount"],
        story: json["story"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        firstName: firstNameValues.map[json["firstName"]]!,
        lastName: lastNameValues.map[json["lastName"]]!,
        profilePic: json["profilePic"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userIdValues.reverse[userId],
        "fileType": fileTypeValues.reverse[fileType],
        "fileName": fileName,
        "filePath": filePath,
        "description": description,
        "likedBy": likedBy == null ? [] : List<dynamic>.from(likedBy!.map((x) => x)),
        "likeCount": likeCount,
        "commentId": commentId == null ? [] : List<dynamic>.from(commentId!.map((x) => x)),
        "commentCount": commentCount,
        "story": story,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "firstName": firstNameValues.reverse[firstName],
        "lastName": lastNameValues.reverse[lastName],
        "profilePic": profilePic,
    };
}

enum FileType {
    IMAGE_JPEG
}

final fileTypeValues = EnumValues({
    "image/jpeg": FileType.IMAGE_JPEG
});

enum FirstName {
    KRISHNA
}

final firstNameValues = EnumValues({
    "krishna": FirstName.KRISHNA
});

enum LastName {
    KUMAR
}

final lastNameValues = EnumValues({
    "kumar": LastName.KUMAR
});

enum UserId {
    THE_660_BFE1817_FF3_F0_D2_FC2_D04_E
}

final userIdValues = EnumValues({
    "660bfe1817ff3f0d2fc2d04e": UserId.THE_660_BFE1817_FF3_F0_D2_FC2_D04_E
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
