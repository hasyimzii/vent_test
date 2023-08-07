class Menu {
  int? id;
  String? name;
  int? price;
  String? type;
  String? image;

  Menu({
    this.id,
    this.name,
    this.price,
    this.type,
    this.image,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json['id'],
        name: json['nama'],
        price: json['harga'],
        type: json['tipe'],
        image: json['gambar'],
      );
}
