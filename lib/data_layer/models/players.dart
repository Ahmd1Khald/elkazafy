class Players {
  int? id;
  String? name;
  String? country;
  String? city;
  String? street;
  String? birthdate;
  String? phoneNumber;
  String? email;
  String? password;
  int? playerPosition;
  String? profilePicture;
  Map? playerData;
  List? rates;
  List? teams;

  Players(
      {this.id,
      this.name,
      this.country,
      this.city,
      this.street,
      this.birthdate,
      this.phoneNumber,
      this.email,
      this.password,
      this.playerPosition,
      this.profilePicture,
      this.playerData,
      this.rates,
      this.teams});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    city = json['city'];
    street = json['street'];
    birthdate = json['birthdate'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    playerPosition = json['playerPosition'];
    profilePicture = json['profilePicture'];
    playerData = json['playerData'];
    rates = json['rates'];
    teams = json['teams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['city'] = this.city;
    data['street'] = this.street;
    data['birthdate'] = this.birthdate;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['playerPosition'] = this.playerPosition;
    data['profilePicture'] = this.profilePicture;
    // data['playerData'] = this.playerData;
    if (this.rates != null) {
      data['rates'] = this.rates!.map((v) => v.toJson()).toList();
    }
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
