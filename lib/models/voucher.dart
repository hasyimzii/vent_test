class Voucher {
  int? id;
  String? code;
  String? image;
  int? discount;
  String? status;
  String? createdAt;
  String? updatedAt;

  Voucher({
    this.id,
    this.code,
    this.image,
    this.discount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json['id'],
        code: json['kode'],
        image: json['gambar'],
        discount: int.parse(json['nominal']),
        status: json['status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
}
