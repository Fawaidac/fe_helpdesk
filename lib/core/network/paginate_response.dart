class PaginateResponse<T> {
  final int currentPage;
  final int lastPage;
  final int total;
  final List<T> data;

  PaginateResponse({
    required this.currentPage,
    required this.lastPage,
    required this.total,
    required this.data,
  });

  factory PaginateResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginateResponse(
      currentPage: json['current_page'] ?? 1,
      lastPage: json['last_page'] ?? 1,
      total: json['total'] ?? 0,
      data: (json['data'] as List<dynamic>)
          .map((e) => fromJsonT(e))
          .toList(),
    );
  }
}