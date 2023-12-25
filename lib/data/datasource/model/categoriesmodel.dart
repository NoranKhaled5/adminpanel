class CategoriesModel {
  String? catId;
  String? name;
  String? description;
  String? categoriesImage;

  CategoriesModel(
      {this.catId,
      this.name,
      this.description,
      this.categoriesImage,
      });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    catId = json['categories_id'];
    name = json['categories_name'];
    description = json['description'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catId'] = this.catId;
    data['name'] = this.name;
    data['categories_image'] = this.categoriesImage;
    data['description'] = this.description;
    return data;
  }
}
