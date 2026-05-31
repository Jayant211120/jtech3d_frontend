//create class
class SignUpModel{
  ///create variables
  final String ? name;
  final String ? email;
  final String ? address;
  final String ? gender;
  final String ? password;
  final String ? role;
  final String ? code;
  final String ? message;
  final int ? mobileNumber;
  final bool ? status;
  final String ? token;

  ///create constructor
  SignUpModel({this.name,this.email,this.address,this.gender,this.password,this.role,this.code,this.message,this.mobileNumber,this.status,this.token});

  //create function
  factory SignUpModel.fromJson(Map<String,dynamic>json){
    final data =json['data'];
    return SignUpModel(
      name:json['name'].toString(),
      email:json['email'].toString(),
      address:json['address'].toString(),
      gender:json['gender'].toString(),
      password:json['password'].toString(),
      role:data['role'].toString(),
      code:json['code'].toString(),
      message:json['message'].toString(),
      mobileNumber:json['mobileNumber'] != null ? int.parse(json['mobileNumber'].toString()) : null,
      status:json['status'],
      token:data['token'].toString()
    );
  }
}