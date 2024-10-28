class UserDto {
  String username, password;

  UserDto(
    this.username,
    this.password,
  );

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
