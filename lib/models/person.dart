class Person {
  int id;
  String name;
  String cid;
  String uid;
  String pwd;
  int address;

  Person({this.id, this.name, this.cid, this.uid, this.pwd, this.address});

  Person.fromMap(dynamic obj) {
    this.id = obj['personId'];
    this.name = obj['personName'];
    this.cid = obj['personCid'];
    this.uid = obj['personUid'];
    this.pwd = obj['personPwd'];
    this.address = obj['FK_person_address'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'personName': name,
      'personCid': cid,
      'personUid': uid,
      'personPwd': pwd,
      'FK_person_address':address,
    };

    return map;
  }
}
