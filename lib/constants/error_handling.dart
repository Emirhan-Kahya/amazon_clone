import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, "Error occurred try to sign up again in a few minutes !");
      print(jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, "Check your informations you filled or try again later !");
      print(jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}
