class UserDetails {
  String? Name;
  String? email;
  String? photoURL;

  //constructor
  UserDetails({this.Name, this.email, this.photoURL});

  // we need to create map
  UserDetails.fromJson(Map<String, dynamic> json) {
    Name = json["displayName"];
    photoURL = json["photoUrl"];
    email = json["email"];
  }
  Map<String, dynamic> toJson() {
    // object - data
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.Name;
    data['email'] = this.email;
    data['photoUrl]'] = this.photoURL;

    return data;

  }
}