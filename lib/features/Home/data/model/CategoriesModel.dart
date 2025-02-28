class CategoriesModel {
  dynamic id, image,name,description;

  CategoriesModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,

  });

  factory CategoriesModel.fromJson(Map<String, dynamic> productDeatils) {
    return CategoriesModel(
      id: productDeatils['id'],

      image: productDeatils['image'],
      name: productDeatils['name'],
      description:productDeatils['description'],

    );
  }

  CategoriesModel fromJson(Map<String, dynamic> json) {
    return CategoriesModel.fromJson(json);
  }

  factory CategoriesModel.init() {
    return CategoriesModel(
      id: '',
      image: '',
      name: '',
      description: '',
    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<CategoriesModel> data = [];
    for (var post in jsonList) {
      data.add(CategoriesModel.fromJson(post));
    }
    return data;
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'image': image,
        'name': name,
        'description':description,

      };
}