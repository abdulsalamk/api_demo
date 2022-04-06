// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.productCode,
    required this.productName,
    required this.productLine,
    this.productScale,
    this.productVendor,
    this.productDescription,
    this.buyPrice,
    this.msrp,
  });

  String productCode;
  String productName;
  String productLine;
  String? productScale;
  String? productVendor;
  String? productDescription;
  String? buyPrice;
  String? msrp;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productCode: json["productCode"],
        productName: json["productName"],
        productLine: json["productLine"],
        productScale: json["productScale"],
        productVendor: json["productVendor"],
        productDescription: json["productDescription"],
        buyPrice: json["buyPrice"],
        msrp: json["MSRP"],
      );

  Map<String, dynamic> toJson() => {
        "productCode": productCode,
        "productName": productName,
        "productLine": productLine,
        "productScale": productScale,
        "productVendor": productVendor,
        "productDescription": productDescription,
        "buyPrice": buyPrice,
        "MSRP": msrp,
      };
}
