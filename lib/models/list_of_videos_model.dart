class ListOfVideosModel {
  List<Data>? data;
  ListOfVideosModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
  String? video;
  String? title;
  String? description;
  int? userId;
  List<Roles>? roles;
  String? createdAt;
  String? updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Roles {
  int? id;
  String? name;

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}
