import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_test/json_response.dart';

  Future<UserData> getUserData() async {
    var url = "http://demo7495688.mockable.io/test_complex_json";
    var response = await http.get(url);

    return compute(parseUserData, response.body);
  }

  UserData parseUserData(String responseBody) {
    var data = Map<String, dynamic>.from(json.decode(responseBody));
    var user = UserData.fromJson(data);
    return user;
  }
