class ProductDeatilsModel {
  dynamic id, price, image, name, description, category, rating, reviews;

  ProductDeatilsModel(
      {required this.id,
      required this.price,
      required this.name,
      required this.reviews,
      required this.description,
      required this.category,
      required this.rating,
      required this.image});

  factory ProductDeatilsModel.fromJson(Map<String, dynamic> product) {
    return ProductDeatilsModel(
      id: product['id'],
      image: product['image'],
      reviews: product['reviews'],
      price: product['price'],
      name: product['name'],
      description: product['description'],
      category: product['category'],
      rating: product['rating'],
    );
  }

  ProductDeatilsModel fromJson(Map<String, dynamic> json) {
    return ProductDeatilsModel.fromJson(json);
  }

  factory ProductDeatilsModel.init() {
    return ProductDeatilsModel(
        id: '',
        price: '',
        name: '',
        category: '',
        reviews: '',
        description: '',
        rating: '',
        image: '');
  }

  fromJsonList(List<dynamic> jsonList) {
    List<ProductDeatilsModel> data = [];
    for (var post in jsonList) {
      data.add(ProductDeatilsModel.fromJson(post));
    }
    return data;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'name': name,
        'reviews': reviews,
        'category': category,
        'description': description,
        'image': image
      };
}
