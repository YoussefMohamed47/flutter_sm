import 'package:cubiiit/models/product_model.dart';
import 'package:cubiiit/repos/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());
  ProductRepo productRepo = ProductRepo();

  getProductData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final List<ProductModel> products = await productRepo.getProductData();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
