class ApiResponse<T> {
  bool status;
  bool? success;
  String? message;
  T? data;
  String? error;

  ApiResponse({
    required this.status,
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
  empty,
}
