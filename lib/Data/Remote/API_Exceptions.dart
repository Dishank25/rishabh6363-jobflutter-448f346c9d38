class APIExceptions implements Exception{
  String ? title;
  String ?  msg;
  APIExceptions({required this.msg, required this.title});

  String ErrorMsg(){
    return "$title:$msg";
}
}

class FetchDataException extends APIExceptions{
  FetchDataException({required String ErrorMsg}):super(title: "No Internet", msg: "ErrorMsg");
}

class BadRequestException extends APIExceptions{
  BadRequestException({required String ErrorMsg}): super(title: "Invalid Request", msg:"ErrorMsg");
}

class UnAuthorizedRequestException extends APIExceptions{
  UnAuthorizedRequestException({required String ErrorMsg}): super(title: "Unauthorised Request", msg: "ErrorMsg");
}

class InvalidInputRequestException extends APIExceptions{
  InvalidInputRequestException({required String ErrorMsg}): super(title: "Invalid Input Request", msg: "ErrorMsg");
}