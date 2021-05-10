part of 'models.dart';

class Space {
  int id;
  String namaSpace;
  String city;
  String country;
  double harga;
  String urlImage;
  int star;
  String address;
  String phone;
  String mapUrl;
  List photo;
  int numberKitchens;
  int numberBedrooms;
  int numberCupboards;

  Space({
    this.id,
    this.namaSpace,
    this.city,
    this.country,
    this.harga,
    this.urlImage,
    this.star,
    this.address,
    this.phone,
    this.mapUrl,
    this.photo,
    this.numberKitchens,
    this.numberBedrooms,
    this.numberCupboards,
  });

  Space.fromJson(json) {
    id = json['id'];
    namaSpace = json['name'];
    city = json['city'];
    country = json['country'];
    harga = json['price'];
    urlImage = json['image_url'];
    star = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    numberKitchens = json['number_of_kitchens'];
    numberBedrooms = json['number_of_bedrooms'];
    numberCupboards = json['number_of_cupboards'];
  }
}
