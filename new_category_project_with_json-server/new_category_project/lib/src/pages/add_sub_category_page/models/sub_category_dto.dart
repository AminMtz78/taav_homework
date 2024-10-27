class SubCategoryDto {
  String title;
  int categoryId, price;

  SubCategoryDto(
    this.title,
    this.categoryId,
    this.price,
  );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'categoryId': categoryId,
      'price': price,
    };
  }
}
