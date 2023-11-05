
import 'dart:convert';

import 'package:compelete_app/cubits/product_cubit/product_states.dart';
import 'package:compelete_app/models/product_model.dart';
import 'package:compelete_app/shared/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates>
{
  ProductCubit() : super(ProductInitialStates());
  static ProductCubit get(context)=>BlocProvider.of(context);
  ProductModel ?productModel;

  Future getProduct() async
  {
    emit(ProductLoadingStates());
     await Api().get(url: 'https://dummyjson.com/products').then((value) {
       final data  = json.decode(value.body);

      productModel = ProductModel.fromJson(data);
      print('mmmmmmmmmmmm${productModel}');

     }).catchError((e){print(e.toString());});



         //print('llllll${productList[1].products?[1].title}');


    }

  }
