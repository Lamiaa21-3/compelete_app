import 'package:compelete_app/cubits/product_cubit/product_cubit.dart';
import 'package:compelete_app/cubits/product_cubit/product_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductCubit.get(context).getProduct();
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Product Screen',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: ListView.builder(
                itemCount: ProductCubit.get(context).productModel?.products?.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(35)),
                    ),
                    child: Card(
                      color: Colors.pink[50],
                      child: Row(
                        children: [
                          Image.network(
                            '${ProductCubit.get(context).productModel?.products?[index].images?[0]}',
                            width: 120,
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${ProductCubit.get(context).productModel?.products?[index].title}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 12,),
                                SizedBox(
                                    width: 160,
                                    child: Text(
                                      '${ProductCubit.get(context).productModel?.products?[index].description}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    )),
                               SizedBox(height: 12,),
                                Text(
                                  '\$${ProductCubit.get(context).productModel?.products?[index].price}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
      },
    );
  }
}
