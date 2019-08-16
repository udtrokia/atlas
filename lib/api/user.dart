import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './config.dart';

/// Get user info 
/// @pages: ['/mine']
class UserInfo {
  final String tel;
  final String name;
  final String mail;
  final dynamic groups;

  UserInfo({this.tel, this.name, this.mail, this.groups});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      tel: json['tel'],
      name: json['name'],
      mail: json['mail'],
      groups: json['groups']
    );
  }
}

Future<UserInfo> userInfo(String id) async {
  String tk = await token();
  if (id == '' && tk == '') { id = '_'; }

  var res = await http.get(
    "${conf['url']}/user/$id",
    headers: {
      'token': tk
    }
  );
    
  if (res.statusCode == 200) {
    return UserInfo.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}

/// Get register
/// @pages: ['/mine/modify']
class UserRegisterAPI {
  final String msg;
  UserRegisterAPI({this.msg});

  factory UserRegisterAPI.fromJson(Map<String, dynamic> json) {
    return UserRegisterAPI(
      msg: json['msg']
    );
  }
}

Future<UserRegisterAPI> userRegister(String tel) async {
  String tk = await token();

  var res = await http.post(
    "${conf['url']}/user/$tel/sms",
    headers: { 'token': tk },
    body: { 'tel': tel }
  );
    
  if (res.statusCode == 200) {
    return UserRegisterAPI.fromJson(json.decode(res.body));
  } else {
    throw Exception('Failed to load post');
  }
}
