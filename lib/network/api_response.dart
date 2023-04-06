class ApiResponse<T> {
  bool isLoading;
  bool? success;
  String? message;
  T? data;
  String? error;

  ApiResponse({
    required this.isLoading,
    this.success,
    this.message,
    this.data,
    this.error,
  });
}

