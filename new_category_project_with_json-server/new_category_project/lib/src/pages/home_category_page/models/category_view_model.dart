class CategoryViewModel {
  int id , userId;
  String title;
  CategoryViewModel(
    this.id,
    this.title,
    this.userId
  );

  factory CategoryViewModel.fromJson({required Map<String, dynamic> json}) {
    return CategoryViewModel(
      json['id'],
      json['title'],
      json['userId'],
    );
  }
}
