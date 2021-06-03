class Address {
  int id;
  String name;
  String stl2;
  String city;
  String state;
  String zip;
  String country;

  Address({
    this.id,
    this.name,
    this.stl2,
    this.city,
    this.state,
    this.zip,
    this.country,
  });

  Address.fromMap(dynamic obj) {
    this.id = obj['addressId'];
    this.name = obj['addressName'];
    this.stl2 = obj['addressStl2'];
    this.city = obj['addressCity'];
    this.state = obj['addressState'];
    this.zip = obj['addressZip'];
    this.country = obj['addressCountry'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'addressName': name,
      'addressStl2': stl2,
      'addressCity': city,
      'addressState': state,
      'addressZip': zip,
      'addressCountry': country,
    };

    return map;
  }
}
