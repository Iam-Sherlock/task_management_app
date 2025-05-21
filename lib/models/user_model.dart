class UserModel {
  String? name;
  bool? isTLuser;
  String? userId;
  String? email;

  UserModel({this.name, this.isTLuser, this.userId, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isTLuser = json['isTLuser'];
    userId = json['userId'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['isTLuser'] = isTLuser;
    data['userId'] = userId;
    data['email'] = email;
    return data;
  }
}
