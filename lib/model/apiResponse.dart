// To parse this JSON data, do
//
//     final serverOtp = serverOtpFromJson(jsonString);

import 'dart:convert';

ServerOtp serverOtpFromJson(String str) => ServerOtp.fromJson(json.decode(str));

String serverOtpToJson(ServerOtp data) => json.encode(data.toJson());

class ServerOtp {
    String message;
    int otp;

    ServerOtp({
        required this.message,
        required this.otp,
    });

    factory ServerOtp.fromJson(Map<String, dynamic> json) => ServerOtp(
        message: json["message"],
        otp: json["OTP"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "OTP": otp,
    };
}
