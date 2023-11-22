class LoginModel {
  String? accessToken;
  String? refreshToken;
  String? expireAt;
  String? role;

  LoginModel({this.accessToken, this.refreshToken, this.expireAt, this.role});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    expireAt = json['expire_at'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['expire_at'] = this.expireAt;
    data['role'] = this.role;
    return data;
  }
}