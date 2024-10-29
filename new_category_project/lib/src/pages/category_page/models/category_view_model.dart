class CategoryViewModel {
  int id, userId, totalPrice = 0;
  String title;

  CategoryViewModel(
    this.totalPrice,
    this.id,
    this.title,
    this.userId,
  );

  factory CategoryViewModel.fromJson({required Map<String, dynamic> json}) {
    return CategoryViewModel(
      json['totalPrice'],
      json['id'],
      json['title'],
      json['userId'],
    );
  }
}
