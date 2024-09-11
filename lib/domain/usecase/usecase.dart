abstract class UseCase<Input, Output> {
  Future<Output> call(Input input);
}

class NoParams {}
