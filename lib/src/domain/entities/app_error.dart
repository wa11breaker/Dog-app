import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  final String _code;
  final String _message;

  const AppException(this._code, this._message);

  @override
  String toString() {
    return "$_code$_message";
  }

  @override
  List<Object?> get props => throw [_message, _code];
}

class FetchDataException extends AppException {
  const FetchDataException([String message = 'Check your interner connection'])
      : super("Error During Communication: ", message);
}

class BadRequestException extends AppException {
  const BadRequestException(message) : super("Invalid Request: ", message);
}

class UnauthorisedException extends AppException {
  const UnauthorisedException(message) : super("Unauthorised: ", message);
}

class InvalidInputException extends AppException {
  const InvalidInputException(String message) : super("Invalid Input: ", message);
}
