class CategoryDto {
  int userId;
  String title;

  CategoryDto(
    this.userId,
    this.title,
  );

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
    };
  }
}
