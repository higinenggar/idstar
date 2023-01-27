class SelectUser {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  SelectUser({this.id, this.name, this.email, this.gender, this.status});

  SelectUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }
}
