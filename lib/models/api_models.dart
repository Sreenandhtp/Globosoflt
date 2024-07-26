// To parse this JSON data, do
//
//     final apiModels = apiModelsFromJson(jsonString);

import 'dart:convert';

ApiModels apiModelsFromJson(String str) => ApiModels.fromJson(json.decode(str));

String apiModelsToJson(ApiModels data) => json.encode(data.toJson());

class ApiModels {
    bool success;
    List<Product> products;

    ApiModels({
        required this.success,
        required this.products,
    });

    factory ApiModels.fromJson(Map<String, dynamic> json) => ApiModels(
        success: json["success"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    String id;
    String name;
    dynamic description;
    String stockStatus;
    dynamic manufacturer;
    String quantity;
    dynamic reviews;
    String price;
    String thumb;
    bool special;
    int rating;

    Product({
        required this.id,
        required this.name,
        required this.description,
        required this.stockStatus,
        required this.manufacturer,
        required this.quantity,
        required this.reviews,
        required this.price,
        required this.thumb,
        required this.special,
        required this.rating,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        stockStatus: json["stock_status"],
        manufacturer: json["manufacturer"],
        quantity: json["quantity"],
        reviews: json["reviews"],
        price: json["price"],
        thumb: json["thumb"],
        special: json["special"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "stock_status": stockStatus,
        "manufacturer": manufacturer,
        "quantity": quantity,
        "reviews": reviews,
        "price": price,
        "thumb": thumb,
        "special": special,
        "rating": rating,
    };
}
