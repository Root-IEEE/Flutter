class AppUser {
  String photoUrl;
  String email;
  String division;
  String id;
  String enrollNo;
  String firebaseUuid;
  String displayName;
  String standard;
  String dob;
  String guardianName;
  String bloodGroup;
  String mobileNo;
  bool isTeacher;
  bool isVerified;

  // Map<String, dynamic> connection;
  var connection;

  String standardDivision() {
    return standard + division.toUpperCase();
  }

  AppUser(
      {this.photoUrl = 'default',
      this.email = '',
      this.division = '',
      this.id = '',
      this.enrollNo = '',
      this.firebaseUuid = '',
      this.connection,
      this.displayName = '',
      this.standard = '',
      this.dob = '',
      this.guardianName = '',
      this.bloodGroup = '',
      this.mobileNo = '',
      this.isTeacher = false,
      this.isVerified = false});

  bool isEmpty() {
    if (displayName == '') return true;

    if (division == '') return true;

    if (standard == '') return true;

    if (guardianName == '') return true;

    return false;
  }

  _fromJson(Map<String, dynamic> json) {
    photoUrl = json['photoUrl'] ?? 'default';
    email = json['email'] ?? '';
    division = json['division'] ?? '';
    id = json['id'] ?? '';
    enrollNo = json['enrollNo'] ?? '';
    firebaseUuid = json['firebaseUuid'] ?? '';
    displayName = json['displayName'] ?? '';
    standard = json['standard'] ?? '';
    dob = json['dob'] ?? '';
    guardianName = json['guardianName'] ?? '';
    bloodGroup = json['bloodGroup'] ?? '';
    mobileNo = json['mobileNo'] ?? '';
    isTeacher = json['isTeacher'] ?? false;
    isVerified = json['isVerified'] ?? false;
    connection = json['connection'] ?? {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photoUrl'] = photoUrl;
    data['email'] = email;
    data['division'] = division.toUpperCase().trim();
    data['id'] = id;
    data['enrollNo'] = enrollNo;
    data['firebaseUuid'] = firebaseUuid;
    data['displayName'] = displayName;
    data['standard'] = standard;
    data['dob'] = dob;
    data['guardianName'] = guardianName;
    data['bloodGroup'] = bloodGroup;
    data['mobileNo'] = mobileNo;
    data['isTeacher'] = isTeacher;
    data['isVerified'] = isVerified;
    data['connection'] = connection;
    return data;
  }
}
