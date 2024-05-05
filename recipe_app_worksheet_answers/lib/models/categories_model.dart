// TODO 04: fill categories properties
// Tips: Use [https://app.quicktype.io/] to generate the model

class CategoriesModel {
  List<CategoryModel> categories;

  CategoriesModel({
    required this.categories,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        categories: List<CategoryModel>.from(
          json["categories"].map(
            (x) => CategoryModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(
          categories.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class CategoryModel {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };
}
