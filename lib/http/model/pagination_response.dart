class PaginationResponse {
  int page = 0;
  int size = 0;
  int total = 0;
  int totalPages = 0;

  PaginationResponse(this.page, this.size, this.total, this.totalPages);

  PaginationResponse.fromJson(Map<String, dynamic> json)
      : page = json['page'] as int,
        size = json['size'] as int,
        total = json['total'] as int,
        totalPages = json['totalPages'] as int;

  Map<String, dynamic> toJson() =>
      {'page': page, 'size': size, 'total': total, 'totalPages': totalPages};
}
