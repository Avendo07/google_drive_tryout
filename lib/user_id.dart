class UserID {
  String uid;
  String contactNo;
  String carNo;
  String fcmToken;

  UserID(this.uid, this.contactNo, this.carNo, this.fcmToken);

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'contactNo': contactNo,
      'uid': uid,
      'carNo': carNo,
      'fcmToken': fcmToken,
    };
  }
}

UserID fromMap(Map<String, dynamic> map) {
  String contactNo = map['contactNo'];
  String uid = map['uid'];
  String carNo = map['carNo'];
  String fcmToken = map['fcmToken'];
  return new UserID(uid, contactNo, carNo, fcmToken);
}
