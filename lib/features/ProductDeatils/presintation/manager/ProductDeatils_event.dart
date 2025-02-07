part of 'ProductDeatils_bloc.dart';

abstract class ProductDeatilsEvent extends Equatable {
  const ProductDeatilsEvent();
}

class GetAllProductDeatils extends ProductDeatilsEvent {
  final String id;
  @override
  List<Object> get props => [];
  const GetAllProductDeatils({required this.id});
}

class GetLast10Product extends ProductDeatilsEvent {
  @override
  List<Object> get props => [];
}
