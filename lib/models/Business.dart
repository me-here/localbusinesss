class Business {
  double lat;
  double lon;
  String address;
  String name;
  String description;
  String imageURL;
  String iconURL;

  Business({
    this.lat,
    this.lon,
    this.address,
    this.name,
    this.description,
    this.imageURL,
    this.iconURL,
  });

  factory Business.fromJSON(Map<String, dynamic> json) {
    final lat = json['lat'].toDouble();
    final lon = json['lon'].toDouble();
    final address = json['address'];
    final name = json['name'];
    final description = json['description'];
    final imageURL = json['imageURL'];

    return Business(
        lat: lat,
        lon: lon,
        address: address,
        name: name,
        description: description,
        imageURL: imageURL);
  }
}
