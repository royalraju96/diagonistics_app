class CartModel {
  String id;
  String rep_time;
  num mrp;

  num b2b_rate;
  String specimen;
  String test;
  String test_code;

  CartModel({
    this.id,
    this.b2b_rate,
    this.specimen,
    this.rep_time,
    this.test,
    this.test_code,
    this.mrp,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    b2b_rate = json['b2_rate'];
    mrp = json['mrp'];

    specimen = json['specimen'];
    test = json['test'];
    rep_time = json['rep_time'];
    test_code = json['test_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['b2_rate'] = this.b2b_rate;
    data['mrp'] = this.mrp;
    data['rep_time'] = this.rep_time;
    data['specimen'] = this.specimen;
    data['test'] = this.test;
    data['test_code'] = this.test_code;

    return data;
  }
}

class PublishedDate {
  String date;

  PublishedDate({this.date});

  PublishedDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
