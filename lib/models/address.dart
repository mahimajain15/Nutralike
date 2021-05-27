class Address {
  int id;
  String name;

  Address({
    this.id,
    this.name,
  });

  Address.fromMap(dynamic obj) {
    this.id = obj['addressId'];
    this.name = obj['addressName'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'addressName': name,
    };

    return map;
  }
}
