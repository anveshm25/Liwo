class ApiResponse<T> {
  Status status;
  bool? success;
  String? message;
  T? data;
  String? error;

  ApiResponse({
    this.status = Status.none,
    this.success,
    this.message,
    this.data,
    this.error,
  });
}

enum Status {
  loading,
  success,
  error,
  none,
}
