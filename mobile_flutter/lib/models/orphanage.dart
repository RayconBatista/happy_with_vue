class Orphanage {
  int id;
  String name;
  double latitude;
  double longitude;
  String about;
  String instructions;
  String openHours;
  bool openOnWeekends;
  List<Images> images;

  Orphanage(
      {this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.about,
        this.instructions,
        this.openHours,
        this.openOnWeekends,
        this.images});

  Orphanage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    about = json['about'];
    instructions = json['instructions'];
    openHours = json['open_hours'];
    openOnWeekends = json['open_on_weekends'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['about'] = this.about;
    data['instructions'] = this.instructions;
    data['open_hours'] = this.openHours;
    data['open_on_weekends'] = this.openOnWeekends;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Orphanage{id: $id, name: $name, latitude: $latitude, longitude: $longitude, about: $about, instructions: $instructions, openHours: $openHours, openOnWeekends: $openOnWeekends, images: $images}';
  }
}

class Images {
  int id;
  String url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}