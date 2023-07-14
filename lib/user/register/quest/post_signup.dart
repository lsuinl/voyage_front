import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../common/urls.dart';
import '../../../common/util.dart';
import '../model/user_information.dart';

//회원가입
Future<int> PostSignUp() async {
  UserInformation user = await GetUserInformation();
  try {
    var response = await http.post(
      Uri.parse('$urls/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": user.email,
        "password": user.password,
        "name": user.name,
        "gender": user.gender, // '여자' 혹은 '남자'
        "univ": user.univ,
        "department": user.department,
        "admissionDate": user.admissionDate, // 23-02-01 형식
        "expectedGraduationDate": user.expectedGraduationDate // 23-02-01 형식
      }),
    );
    print(response.body);
    return response.statusCode;
  } catch (e) {
    throw e;
  }
}
