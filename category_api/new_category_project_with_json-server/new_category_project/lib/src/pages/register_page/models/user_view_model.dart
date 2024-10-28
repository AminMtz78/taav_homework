class UserViewModel {
  int id;
  String username, password;

  UserViewModel(
      this.id,
      this.username,
      this.password,
      );

  factory UserViewModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return UserViewModel(
      json['id'],
      json['username'],
      json['password'],
    );
  }
}