import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_task/core/api/api_manager.dart';
import 'package:internship_task/features/ProductDetails/presentation/pages/product_details.dart';

import '../bloc/home_bloc.dart';
import '../widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(ApiManager())..add(GetProductEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.failure) {
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                      title: Center(child: Text("An Error Occurred")),
                    ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(
                "Slash.",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.arrow_back),
            ),
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Expanded(
                    child: GridView.builder(
                  itemCount: state.products?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                  state.products?[index].id.toString() ?? "")),
                        );
                      },
                      child: ProductCard(
                        productName: state.products?[index].name ?? "loading",
                        price: state
                                .products?[index].productVariations?[0].price ??
                            0,
                        imageLink: state.products?[index].productVariations?[0]
                                .productVarientImages?[0].imagePath ??
                            "",
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (191.w / 260.h),
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
