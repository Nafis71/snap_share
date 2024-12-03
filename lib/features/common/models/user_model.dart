class UserModel {
  String? displayName;
  String? phoneNumber;
  String? email;
  String? isEmailVerified;
  String? photoUrl;
  String? refreshToken;
  String? uId;

  UserModel(
    this.displayName,
    this.phoneNumber,
    this.email,
    this.isEmailVerified,
    this.photoUrl,
    this.refreshToken,
    this.uId,
  );

  UserModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'] ?? "Unknown";
    phoneNumber = json['phoneNumber'] ?? "N/A";
    email = json['email'] ?? "N/A";
    isEmailVerified = json['isEmailVerified'] ?? "";
    photoUrl = json['photoUrl'] ?? "";
    refreshToken = json['refreshToken'] ?? "";
    uId = json['uId'] ?? "";
  }
}
