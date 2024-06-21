import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:slash_task/core/services/api_status.dart';

///This class have all general api-related functions
class Services{
  Future<Object> fetchData(String dataUrl) async {
    var url = Uri.parse(dataUrl);
    try{
      var res = await http.get(url).timeout(const Duration(seconds: 5));
      if(res.statusCode != SUCCESS){
        return Fail(errorMsg: "Invalid Response",code: INVALID_RESPONSE);
      }else{
        return Success(responseBody: jsonDecode(res.body)["record"],code: SUCCESS);
      }
    }on FormatException {
      return Fail(errorMsg: "Invalid Data Format!", code: INVALID_FORMAT);
    }on SocketException {
      return Fail(errorMsg: "No Internet Connection.",code: NO_INTERNET);
    }on TimeoutException{
      return Fail(errorMsg: "Request Timed Out.",code: TIMED_OUT);
    }
    catch(e){
      return Fail(errorMsg: "Unknown Error!",code: UNKNOWN_ERROR);
    }
  }
}