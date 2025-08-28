class CategoryResponseModel {
  List<String> categories;
  CategoryResponseModel({required this.categories});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(categories: json['categories']);
  }
}