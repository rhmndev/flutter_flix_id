sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success;
  const factory Result.failed(String message) = Failed;

  //properti untuk mengecek apakah Success or Failed
  bool get isSuccess => this is Success<T>;
  bool get isFailed => this is Failed<T>;

  T? get resultValue => isSuccess ? (this as Success<T>).value : null;
  String? get errorMessage => isFailed ? (this as Failed<T>).message : null;
}

// class generic untuk Succcess
class Success<T> extends Result<T> {
  final T value;

  const Success(this.value);
}

// class generic untuk Failed
class Failed<T> extends Result<T> {
  final String message;

  const Failed(this.message);
}
