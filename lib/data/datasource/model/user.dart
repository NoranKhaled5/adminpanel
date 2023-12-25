class UserModel {
  String? UserId;
  String? UserEmail;
  String? UserPassword;
  String? UserImage;
  String? UserDatetime;

  UserModel(
      {this.UserId,
        this.UserEmail,
        this.UserPassword,
        this.UserImage,
        this.UserDatetime});

  UserModel.fromJson(Map<String, dynamic> json) {
    UserId = json['User_id'];
    UserEmail = json['User_Email'];
    UserPassword = json['User_Email'];
    UserImage = json['User_image'];
    UserDatetime = json['User_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_id'] = this.UserId;
    data['User_Email'] = this.UserEmail;
    data['User_Password'] = this.UserPassword;
    data['User_image'] = this.UserImage;
    data['User_datetime'] = this.UserDatetime;
    return data;
  }
}
