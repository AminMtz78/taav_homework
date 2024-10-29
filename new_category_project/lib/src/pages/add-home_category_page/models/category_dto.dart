class CategoryDto {
  int userId, totalPrice = 0;
  String title;

  CategoryDto(
    this.totalPrice,
    this.userId,
    this.title,
  );

  Map<String, dynamic> toJson() {
    return {
      'totalPrice': totalPrice,
      'userId': userId,
      'title': title,
    };
  }
}
