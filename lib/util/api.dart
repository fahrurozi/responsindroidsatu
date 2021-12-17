// import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'dart:convert';
// import 'package:provider/provider.dart';
import 'package:sethcapp/domain/user.dart';
// import 'package:sethcapp/providers/user_provider.dart';

Future<Map<String, dynamic>> hitApiAuth (String url, Map<String, dynamic> data, [String username="cuser0", String password="123450"]) async{
    data["username"] = username;
    data["password"] = password;


    Response response = await post(
      url,
      body: json.encode(data),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    return responseData;
}

Future<Map<String, dynamic>> hitApiUs (User user, String url, Map<String, dynamic> data) async{
    var username = user.username;
    var password = user.password;
    return hitApiAuth(url, data, username, password);
}


Future<Map<String, dynamic>> hitApi(String url, Map<String, dynamic> data) async {
    Response response = await post(
      url,
      body: json.encode(data),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    return responseData;
}

Future<Map<String, dynamic>> hitApiGet(String url, Map<String, dynamic> queryParams) async {
    final urlWithQueryParams = Uri.parse('$url')
      .replace(queryParameters: queryParams);

    Response response = await get(urlWithQueryParams);

    final Map<String, dynamic> responseData = json.decode(response.body);
    return responseData;
}

Future<Map<String, dynamic>> hitApiDelete(String url, Map<String, dynamic> body) async {
    final request = Request('DELETE', Uri.parse(url));
    request.body = json.encode(body);

    StreamedResponse response = await request.send();

    String responseStr = await response.stream.bytesToString();

    final Map<String, dynamic> responseData = json.decode(responseStr);
    return responseData;
}

Future<Map<String, dynamic>> hitAPIPatch(String url, Map<String, dynamic> data) async {
    Response response = await patch(
      url,
      body: json.encode(data),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    return responseData;
}