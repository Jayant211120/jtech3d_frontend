//create model class
class EmailVerificationModel {
  //create variable
  final String? email;
  final int? otp;
  final int? resendOtp;
  final bool ? status;
  final String? message;

  //create constructor
  EmailVerificationModel({this.email, this.otp, this.resendOtp,this.status,this.message});

  //create factory function
  factory EmailVerificationModel.fromJson(Map<String, dynamic> json) {
    return EmailVerificationModel(
      email: json['email'].toString(),
      otp: json['otp'] != null ? int.parse(json['otp'].toString()) : null,
      resendOtp: json['resendOtp'] != null
          ? int.parse(json['resendOtp'].toString())
          : null,
      status:json['status'],
      message: json['message'].toString(),
    );
  }
}
