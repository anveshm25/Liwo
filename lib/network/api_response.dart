class ApiResponse<T> {
  bool isLoading;
  bool success;
  String message;
  T? data;
  String? error;

  ApiResponse({
    required this.isLoading,
    required this.success,
    required this.message,
    this.data,
    this.error,
  });
}
