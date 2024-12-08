class UserModel {
  String? displayName;
  String? phoneNumber;
  String? email;
  bool? isEmailVerified;
  String? photoUrl;
  String? refreshToken;
  String? uId;
  bool? hasUpdatedInfo;

  UserModel({
    this.displayName,
    this.phoneNumber,
    this.email,
    this.isEmailVerified,
    this.photoUrl,
    this.refreshToken,
    this.uId,
    this.hasUpdatedInfo,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'] ?? "Unknown";
    phoneNumber = json['phoneNumber'] ?? "N/A";
    email = json['email'] ?? "N/A";
    isEmailVerified = json['isEmailVerified'] ?? "";
    photoUrl = json['photoUrl'] ?? "";
    refreshToken = json['refreshToken'] ?? "";
    uId = json['uId'] ?? "";
    hasUpdatedInfo = json['hasUpdatedInfo'] ?? false;
  }
}
