

/*
Actual JSON
{
    "name" : "Username",
    "age": 25,
    "location": {
        "city": "cityname",
        "pincode":67895
    },
    "contact": [
        {
            "num1": "987456321",
            "num2": "587945621"
        }
    ]
}

Paste it here: https://javiercbk.github.io/json_to_dart/
to get This class.
 */

class UserData {
  String name;
  int age;
  Location location;
  List<Contact> contact;

  UserData({this.name, this.age, this.location, this.contact});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    if (json['contact'] != null) {
      contact = new List<Contact>();
      json['contact'].forEach((v) {
        contact.add(new Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String city;
  int pincode;

  Location({this.city, this.pincode});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    return data;
  }
}

class Contact {
  String num1;
  String num2;

  Contact({this.num1, this.num2});

  Contact.fromJson(Map<String, dynamic> json) {
    num1 = json['num1'];
    num2 = json['num2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num1'] = this.num1;
    data['num2'] = this.num2;
    return data;
  }
}