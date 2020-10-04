class Business {
  double lat;
  double lon;
  String address;
  String name;
  String description;
  String imageURL;

  Business({
    this.lat,
    this.lon,
    this.address,
    this.name,
    this.description,
    this.imageURL,
  });

  Business.fromJSON(Map<String, dynamic> json)
      : lat = json['lat'],
        lon = json['lon'],
        address = json['address'],
        name = json['name'],
        description = json['description'],
        imageURL = json['imageURL'];
}
