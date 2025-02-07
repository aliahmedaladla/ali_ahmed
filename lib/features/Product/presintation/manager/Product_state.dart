part of 'Product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductILoaded extends ProductState {
  List<ProductModel> productModel;
  ProductILoaded({required this.productModel});

  @override
  List<Object> get props => [ProductModel];
}

class ProductError extends ProductState {
  String errorMessage;

  ProductError({required this.errorMessage});

  @override
  List<Object> get props => [];
}
