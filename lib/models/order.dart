class Order {
  int? voucherId;
  int? discount;
  int? price;
  List<OrderData>? data;

  Order({
    this.voucherId,
    this.discount,
    this.price,
    this.data,
  });

  Map<String, dynamic> toJson() => {
        'voucher_id': voucherId,
        'nominal_diskon': discount,
        'nominal_pesanan': price,
        'items': data == null ? [] : List<OrderData>.from(data!.map((x) => x.toJson())),
  };
}

class OrderData {
  int? id;
  int? price;
  String? notes;

  OrderData({
    this.id,
    this.price,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "harga": price,
        "catatan": notes,
    };
}