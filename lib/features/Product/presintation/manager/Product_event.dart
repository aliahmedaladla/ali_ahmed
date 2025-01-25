part of 'Product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetAllProduct extends ProductEvent {
  @override
  List<Object> get props => [];
  const GetAllProduct();
}

class GetLast10Product extends ProductEvent {
  @override
  List<Object> get props => [];
}
