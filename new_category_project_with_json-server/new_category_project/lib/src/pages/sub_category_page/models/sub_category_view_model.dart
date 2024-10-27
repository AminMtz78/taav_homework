class SubCategoryViewModel {
  int id, price, categoryId;
  String title;

  SubCategoryViewModel(
    this.id,
    this.price,
    this.categoryId,
    this.title,
  );

  factory SubCategoryViewModel.formJson({required Map<String, dynamic> json}) {
    return SubCategoryViewModel(
      json['id'],
      json['price'],
      json['categoryId'],
      json['title'],
    );
  }
}
