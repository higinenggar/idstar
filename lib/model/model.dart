class GetDataModel {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  GetDataModel({this.id, this.name, this.email, this.gender, this.status});

  GetDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }
}
