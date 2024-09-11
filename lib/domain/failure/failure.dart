abstract class Failure implements Exception {
  final String message;

  const Failure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Failure && message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class DefaultFailure extends Failure {
  DefaultFailure(super.message);
}

class InternalServerError extends Failure {
  InternalServerError(super.message);
}

class SomethingWentWrong extends Failure {
  SomethingWentWrong(super.message);
}

class NoInternetException extends Failure {
  NoInternetException(super.message);
}
