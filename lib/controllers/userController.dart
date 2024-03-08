import 'dart:convert';
import 'dart:developer';
import 'package:bcrypt/bcrypt.dart';
import 'package:campus_swap/constants/firebase_strings.dart';
import 'package:campus_swap/services/storage_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserCotroller extends GetxController
{
  var Storage = StorageServices();



  //  For User Registration and Login 

  var serverOTP = null.obs; 
  var otpSend = false.obs;
  var otpVerified = false.obs;


TextEditingController nameCotroller = TextEditingController();
TextEditingController uidCotroller = TextEditingController();
TextEditingController mobileCotroller = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController otpController = TextEditingController();




Future <void> sendOTP() async{

  final userExistance = await FirebaseFirestore.instance.collection(user).doc(uidCotroller.text).get();
  
  if(!userExistance.exists)
  { 
    // userExist(false);
    final url ='https://waste2wealth.onrender.com/api/user/verifyUser/:${uidCotroller.text}@cuchd.in';
    final res = await http.get(Uri.parse(url));
    final Map<String, dynamic> data = json.decode(res.body);
    if(res.statusCode == 200)
    {
      serverOTP = data['OTP'];
      otpSend(true);
    }
  }
  else
  {
    // userExist(true);
    log('user Already Exist ');
  }

}


void verifyOTP() async {
  if(otpController.text == serverOTP.value)
  {
    otpVerified(true);
  }
}


Future <void> saveUserData()async {

  var uid = uidCotroller.text;
  var name = nameCotroller.text;
  var phone = mobileCotroller.text;
  var password = BCrypt.hashpw(passwordController.text, BCrypt.gensalt());
  var email = '${uid}@cuchd.in';


  await FirebaseFirestore.instance.collection('user').doc(uid).set({
    'uid':uid,
    'name':name,
    'phone':phone,
    'password':password,
    'email':email
  });

}



}