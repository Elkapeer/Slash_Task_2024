//home data url
const homeDataUrl = "https://api.jsonbin.io/v3/b/667309ecacd3cb34a859ea67";

//error codes
const INVALID_RESPONSE = 400;
const NO_INTERNET = 401;
const INVALID_FORMAT = 402;
const UNKNOWN_ERROR = 403;
const NOT_FOUND = 404;
const TIMED_OUT = 405;

//success codes
const SUCCESS = 200;


//response objects
class Success{
  Object? responseBody;
  int? code;

  Success({this.responseBody,this.code});
}

class Fail{
  String? errorMsg;
  int? code;

  Fail({this.errorMsg,this.code});
}