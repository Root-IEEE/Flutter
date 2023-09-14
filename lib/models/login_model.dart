class AppLoginModel {
  String? token;
  UserData? data;


  AppLoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;


  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}
