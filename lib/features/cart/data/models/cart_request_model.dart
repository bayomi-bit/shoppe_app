
class CartRequestModel {
int? userId;
List<ProductsRequest>? products;

CartRequestModel({this.userId, this.products});

CartRequestModel.fromJson(Map<String, dynamic> json) {
userId = json['userId'];
if (json['products'] != null) {
products = <ProductsRequest>[];
json['products'].forEach((v) {
products!.add(ProductsRequest.fromJson(v));
});
}
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
data['userId'] = userId;
if (products != null) {
data['products'] = products!.map((v) => v.toJson()).toList();
}
return data;
}
}

class ProductsRequest {
int? id;
int? quantity;

ProductsRequest({this.id, this.quantity});

ProductsRequest.fromJson(Map<String, dynamic> json) {
id = json['id'];
quantity = json['quantity'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
data['id'] = id;
data['quantity'] = quantity;
return data;
}
}