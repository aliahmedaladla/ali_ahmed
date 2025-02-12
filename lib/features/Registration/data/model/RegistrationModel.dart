class RegistrationModel {
  dynamic message, token;

  RegistrationModel({required this.message,
    required this.token,});

  factory RegistrationModel.fromJson(Map<String, dynamic> product) {
    return RegistrationModel(
      message: product['message'],

      token: product['token'],

    );
  }

  RegistrationModel fromJson(Map<String, dynamic> json) {
    return RegistrationModel.fromJson(json);
  }

  factory RegistrationModel.init() {
    return RegistrationModel(
      message: '',
      token: '',
    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<RegistrationModel> data = [];
    for (var post in jsonList) {
      data.add(RegistrationModel.fromJson(post));
    }
    return data;
  }

  Map<String, dynamic> toJson() =>
      {
        'message': message,
        'token': token,

      };
}