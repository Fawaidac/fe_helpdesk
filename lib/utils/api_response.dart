class ApiResponse<T> {
  final bool success;
  final String message;
  final int code;
  final T? data;

  ApiResponse({
    required this.success,
    required this.message,
    required this.code,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      code: json['code'] ?? 0,
      data: json['data'],
    );
  }
}
