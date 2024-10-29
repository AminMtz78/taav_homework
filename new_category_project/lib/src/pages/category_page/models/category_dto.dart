class CategoryDto {
  int userId, totalPrice = 0;
  String title;

  CategoryDto(
    this.userId,
    this.totalPrice,
    this.title,
  );

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'totalPrice': totalPrice,
    };
  }
}
