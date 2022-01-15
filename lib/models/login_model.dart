class LoginModel {

  String name;
  String phone;
  String email;
  String uid;
  String image;

  LoginModel(this.name, this.phone, this.email, this.uid, this.image,);

  LoginModel.fromJson(Map<String, dynamic> json)
  {
    name= json['name'];
    phone= json['phone'];
    email= json['email'] ;
    uid= json['uid'];
    image= json['image'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'phone':phone,
      'email':email,
      'uid':uid,
    'image': image,
    };
  }

}

